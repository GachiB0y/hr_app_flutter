import 'dart:io';

import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/features/user/model/user/user_info.dart';
import 'package:hr_app_flutter/features/user/model/user_view_model/user_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<IUserRepository>(),
    MockSpec<File>(),
  ],
)
void main() {
  group('userBLoC Test BLoC', () {
    // Создайте экземпляры мок-объектов

    late IUserRepository mockUserRepository;

    // Создайте экземпляр вашего BLoC
    late UserBloc userBloc;
    //Создаем фаил автара
    final File file = MockFile();
    // Создаем список тэгов
    List<TagUser> tags = [
      const TagUser(id: 19, name: "Официальный спонсор ГИБДД"),
      const TagUser(id: 25, name: "Vagodrocher🇩🇪")
    ];
    //Создаем пользователя
    UserInfo user = UserInfo(
      autoCard: 4761,
      name: 'Минаев',
      nameI: 'Дмитрий',
      nameO: 'Владимирович',
      staffPosition: 'Специалист',
      avatar:
          'http://grass-app-files.grass.su/files/avatars/user_02304761/c3e005773adc.webp',
      tags: tags,
      self: true,
    );
    //Создаем пользователя с новым тэгом
    late UserInfo newUser;
    //Создаем  новый тэг
    TagUser newTag = const TagUser(id: 228, name: "Новый тэг");

    //Создаем модель пользователя
    late UserProfileViewModel userProfileViewModel;

    setUp(() {
      // Инициализируйте мок-объекты и ваш BLoC перед каждым тестом

      mockUserRepository = MockIUserRepository();
      userProfileViewModel =
          UserProfileViewModel(authUser: user, currentProfileUser: null);

      userBloc = UserBloc(userRepo: mockUserRepository);
      final List<TagUser> newListTag = [...tags];
      newListTag.add(newTag);
      newUser = user.copyWith(tags: newListTag);
    });

    tearDown(() {
      userBloc.close();
    });

    test('initial state is  data null', () {
      expect(userBloc.state.data, isNull);
    });

    test('Initial state should be idle', () {
      expect(userBloc.state, idleState);
    });

    blocTest<UserBloc, UserState>(
        'emits [processing, error, idle] when fetch user Exception throws',
        setUp: () {
          when(mockUserRepository.getUserInfo()).thenThrow(Exception('oops'));
        },
        build: () => UserBloc(userRepo: mockUserRepository),
        act: (bloc) => bloc.add(const UserEventFetch()),
        errors: () => [isA<Exception>()]);

    blocTest<UserBloc, UserState>(
      'emits UserState.successful when Fetch User event is added',
      setUp: () {
        when(mockUserRepository.getUserInfo()).thenAnswer((_) async => user);
      },
      build: () => userBloc,
      act: (bloc) => bloc.add(const UserEventFetch()),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'user',
          userProfileViewModel,
        ),
        idleState
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserState.successful when Get user by id event is added',
      setUp: () {
        when(mockUserRepository.getUserInfoById(userId: '4761'))
            .thenAnswer((_) async => user);
      },
      seed: () => UserState$Idle(data: userProfileViewModel),
      build: () => userBloc,
      act: (bloc) => bloc.add(const UserEventGethUserByUserId(userId: '4761')),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'user Profile ViewModel',
          userProfileViewModel.copyWith(currentProfileUser: user),
        ),
        idleState
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserState.successful when Add Tag event is added',
      setUp: () {
        when(mockUserRepository.getUserInfoById(userId: '4761'))
            .thenAnswer((_) async => user);
      },
      seed: () => UserState$Idle(
          data: userProfileViewModel.copyWith(currentProfileUser: user)),
      build: () => userBloc,
      act: (bloc) => bloc.add(UserEventAddTag(tag: newTag)),
      expect: () => <dynamic>[
        // processingState,
        idleState.having(
          (state) => state.data,
          'user before add Tag',
          userProfileViewModel.copyWith(currentProfileUser: newUser),
        ),
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserState.successful when Delete Tag event is added',
      setUp: () {
        when(mockUserRepository.getUserInfoById(userId: '4761'))
            .thenAnswer((_) async => user);
      },
      seed: () => UserState$Idle(
          data: userProfileViewModel.copyWith(currentProfileUser: newUser)),
      build: () => userBloc,
      act: (bloc) => bloc.add(UserEventDeleteTag(tag: newTag)),
      expect: () => <dynamic>[
        // processingState,
        idleState.having(
          (state) => state.data,
          'user before delete Tag',
          userProfileViewModel.copyWith(currentProfileUser: user),
        ),
      ],
    );
    blocTest<UserBloc, UserState>(
      'emits UserState.successful when Save Tags event is added',
      setUp: () {
        when(mockUserRepository.saveTagsToSend(userId: 4761, tags: [newTag]))
            .thenAnswer((_) async => true);
        when(mockUserRepository.getUserInfoById(userId: '4761'))
            .thenAnswer((_) async => newUser);
      },
      seed: () => UserState$Idle(data: userProfileViewModel),
      build: () => userBloc,
      act: (bloc) =>
          bloc.add(UserEventSaveTagsToSend(userId: 4761, tags: [newTag])),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'user Profile  Save Tag',
          userProfileViewModel.copyWith(currentProfileUser: newUser),
        ),
        idleState
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits UserState.successful when Save Avatar event is added',
      setUp: () {
        when(mockUserRepository.sendAvatarWithProfile(
          imageFile: file,
        )).thenAnswer((_) async => true);
        when(mockUserRepository.getUserInfoById(userId: '4761'))
            .thenAnswer((_) async => user);
      },
      seed: () => UserState$Idle(data: userProfileViewModel),
      build: () => userBloc,
      act: (bloc) => bloc
          .add(UserEventSendAvatarWithProfile(userId: 4761, imageFile: file)),
      expect: () => <dynamic>[
        processingState,
        successfulState.having(
          (state) => state.data,
          'user Profile   Save Avatar',
          userProfileViewModel.copyWith(currentProfileUser: user),
        ),
        idleState
      ],
    );
  });
}

const idleState = TypeMatcher<UserState$Idle>();
const errorState = TypeMatcher<UserState$Error>();
const processingState = TypeMatcher<UserState$Processing>();
const successfulState = TypeMatcher<UserState$Successful>();
