import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class CreateRefactoringPhotoNewsState {
  final EventEntity currentNews;
  final File? file;
  final bool isNewsChecked;

  /// Состояние блока [CreateRefactoringPhotoNewsCubit].
  CreateRefactoringPhotoNewsState({
    this.currentNews = const EventEntity(),
    this.file,
    this.isNewsChecked = false,
  });

  CreateRefactoringPhotoNewsState copyWith({
    EventEntity? currentNews,
    File? file,
    bool? isNewsChecked,
  }) {
    return CreateRefactoringPhotoNewsState(
      currentNews: currentNews ?? this.currentNews,
      file: file ?? this.file,
      isNewsChecked: isNewsChecked ?? this.isNewsChecked,
    );
  }
}

class CreateRefactoringPhotoNewsCubit extends Cubit<CreateRefactoringPhotoNewsState> {
  late IEventEntityRepository _eventEntityRepository;

  /// Блок экрана выбора или изменения фотографии новости.
  CreateRefactoringPhotoNewsCubit({
    required IEventEntityRepository eventEntityRepository,
  }) : super(
          CreateRefactoringPhotoNewsState(),
        ) {
    _eventEntityRepository = eventEntityRepository;
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    final currentNews = _eventEntityRepository.currentNews;
    emit(state.copyWith(currentNews: currentNews));
  }

  /// Колбек на выбор времени.
  Future<void> changePhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    File file = File(pickedFile.path);
    emit(
      state.copyWith(file: file),
    );
  }

  /// Сохранить изменения.
  Future<void> saveChanges() async {
    if (state.currentNews.id == null) {
      if (state.file == null) return;
      List<String> categories = [];
      for (var e in state.currentNews.categories!) {
        categories.add(e.id.toString());
      }
      await _eventEntityRepository.createNewEventEntity(
        title: state.currentNews.title!,
        description: state.currentNews.description!,
        startDate: DateFormat('yyyy-MM-ddTHH:mm:ss').format(state.currentNews.startDate!),
        endDate: null,
        imageFile: state.file!,
        categories: categories,
        vote: [],
      );
      showCheckingNewsScreen();
    } else {
      await _eventEntityRepository.updateNews(
        news: state.currentNews,
        file: state.file,
      );
    }
    await _eventEntityRepository.getApprovmentEvents();
  }

  /// Показать экран "Новость на проверке".
  void showCheckingNewsScreen() {
    emit(state.copyWith(isNewsChecked: true));
  }
}
