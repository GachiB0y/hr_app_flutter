import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_events_view_model.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/my_picker_image.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final CreateEventsViewModel _model = CreateEventsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvaider<CreateEventsViewModel>(
      model: _model,
      child: const BucketNavigator(bucket: 'create-news'),
    );
  }
}

/// Exmaple News Screen
class ExmapleNewsScreen extends StatelessWidget {
  const ExmapleNewsScreen({super.key});
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    final date = DateFormat('dd MMMM').format(newsModel!.startDate);
    final time = DateFormat('HH:mm').format(newsModel.startDate);

    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: BlocListener<EventEntityBloc, EventEntityState>(
        listener: (context, state) {
          if (state is EventEntityState$Error) {
            showSnackBar(context, 'Ошибка создания новости!');
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: VerificationNewsTitleWidget(),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                          height: 274,
                          child: Image.file(newsModel.file!, fit: BoxFit.fill)),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 43)),
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 36),
                      sliver: SliverToBoxAdapter(
                        child: DisplayDateAndTimeWidget(date: date, time: time),
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 18)),
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 36),
                      sliver: SliverToBoxAdapter(
                        child: Text(newsModel.title!,
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 18)),
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 36),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          newsModel.description!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<EventEntityBloc, EventEntityState>(
                  builder: (context, state) {
                if (state is EventEntityState$Processing) {
                  return const CircularProgressIndicator();
                } else {
                  return ResumeButtonWidget(
                    title: 'Создать',
                    onPressed: () {
                      context.read<EventEntityBloc>().add(
                          EventEntityEvent.create(
                              title: newsModel.title!,
                              description: newsModel.description!,
                              imageFile: newsModel.file!,
                              categories: newsModel.selectedItems!,
                              startDate: newsModel.startDate.toString(),
                              endDate: null));

                      context.octopus.setState(
                          (state) => state..removeByName('create-news'));
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayDateAndTimeWidget extends StatelessWidget {
  const DisplayDateAndTimeWidget({
    super.key,
    required this.date,
    required this.time,
  });

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DateOrTimeWidget(
          text: date,
        ),
        const SizedBox(
          width: 7,
        ),
        DateOrTimeWidget(
          text: time,
        ),
      ],
    );
  }
}

class DateOrTimeWidget extends StatelessWidget {
  const DateOrTimeWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(145),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}

class VerificationNewsTitleWidget extends StatelessWidget {
  const VerificationNewsTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xffD3F2D4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Новость на проверке',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}

/// Add Photo News Screen
class AddPhotoNewsScreen extends StatelessWidget {
  const AddPhotoNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Добавь фото',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23.0, right: 23.0, top: 20.0),
              child: MyPickerImage(),
            ),
            const Spacer(),
            ResumeButtonWidget(
              title: 'Продолжить',
              onPressed: () {
                context.octopus.setState((state) => state
                  ..findByName('create-news')?.add(Routes.exampleNews.node()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Write Description News Screen

class WriteDescriptionNewsScreen extends StatefulWidget {
  const WriteDescriptionNewsScreen({super.key});

  @override
  State<WriteDescriptionNewsScreen> createState() =>
      _WriteDescriptionNewsScreenState();
}

class _WriteDescriptionNewsScreenState
    extends State<WriteDescriptionNewsScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    if (newsModel != null && newsModel.description != null) {
      _descriptionController.text = newsModel.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Опиши мероприятие',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  maxLines: 12,
                  minLines: 5,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText:
                        'Введи описание, не забудь указать место проведения',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    newsModel?.description = _descriptionController.text;
                    context.octopus.setState((state) => state
                      ..findByName('create-news')
                          ?.add(Routes.createNewsPhoto.node()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Write Title News Screen

class WriteTitleNewsScreen extends StatefulWidget {
  const WriteTitleNewsScreen({super.key});

  @override
  State<WriteTitleNewsScreen> createState() => _WriteTitleNewsScreenState();
}

class _WriteTitleNewsScreenState extends State<WriteTitleNewsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    if (newsModel != null && newsModel.title != null) {
      _titleController.text = newsModel.title!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Напиши заголовок',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  maxLength: 256,
                  maxLines: 10,
                  minLines: 5,
                  controller: _titleController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText: 'Введите заголовок',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    newsModel?.title = _titleController.text;
                    context.octopus.setState((state) => state
                      ..findByName('create-news')
                          ?.add(Routes.createNewsDescrition.node()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Selected News Time Screen
class SelectedNewsTimeScreen extends StatefulWidget {
  const SelectedNewsTimeScreen({super.key});

  @override
  State<SelectedNewsTimeScreen> createState() => _SelectedNewsTimeScreenState();
}

class _SelectedNewsTimeScreenState extends State<SelectedNewsTimeScreen> {
  Duration? time;

  String TimeLeft(diff) {
    var timestamp = diff.floor();
    var hours = (timestamp / 60 / 60).floor();
    var minutes = ((timestamp / 60) - (hours * 60)).floor();
    var seconds = timestamp % 60;
    if (seconds < 0) {
      seconds = 0;
      hours = 0;
      minutes = 0;
    }
    String hs = hours.toString();
    hs = hs.length > 1 ? hs : "0$hs";
    String ms = minutes.toString();
    ms = ms.length > 1 ? ms : "0$ms";
    String ss = seconds.toString();
    ss = ss.length > 1 ? ss : "0$ss";
    return "$hs:$ms";
  }

  @override
  Widget build(BuildContext context) {
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Выбери время проведения',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
              ),
            ),
            CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              onTimerDurationChanged: (Duration value) {
                setState(() {
                  time = value;
                });
              },
            ),
            const Spacer(),
            time == null
                ? const SizedBox.shrink()
                : Center(
                    child: Text(
                      'Время: ${TimeLeft(time!.inSeconds)}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 22),
                    ),
                  ),
            const SizedBox(height: 10),
            ResumeButtonWidget(
              title: 'Продолжить',
              onPressed: () {
                if (time == null) {
                  return;
                }
                final newData = newsModel?.startDate.copyWith();
                final data = newData?.add(time!);
                newsModel?.startDate = data!;

                context.octopus.setState((state) => state
                  ..findByName('create-news')
                      ?.add(Routes.createNewsTitle.node()));
                print('ModelStartDate:${newsModel?.startDate}');
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Selected News Date Screen

class SelectedNewsDateScreen extends StatefulWidget {
  const SelectedNewsDateScreen({super.key});

  @override
  _SelectedNewsDateScreenState createState() => _SelectedNewsDateScreenState();
}

class _SelectedNewsDateScreenState extends State<SelectedNewsDateScreen> {
  DateTime selectedDate = DateTime.now();
  final formatter = DateFormat('dd.MM');

  @override
  Widget build(BuildContext context) {
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Выбери дату мероприятия',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
              ),
            ),
            CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (DateTime value) {
                  setState(() {
                    selectedDate = value;
                  });

                  newsModel?.startDate = selectedDate;
                }),
            const Spacer(),
            Center(
              child: Text(
                'Дата: ${formatter.format(selectedDate)}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
              ),
            ),
            const SizedBox(height: 10),
            ResumeButtonWidget(
              title: 'Продолжить',
              onPressed: () {
                if (newsModel?.startDate == null) {
                  return;
                }
                context.octopus.setState((state) => state
                  ..findByName('create-news')
                      ?.add(Routes.createNewsTime.node()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Selected Type News Scren

class SelectedTypeNewsScreen extends StatelessWidget {
  const SelectedTypeNewsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarForCreateNews(),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Выбери тип события',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
              ),
            ),
            const TypeListWidget(),
            const Spacer(),
            ResumeButtonWidget(
              title: 'Продолжить',
              onPressed: () {
                final newsModel = ChangeNotifierProvaider.read<
                    ChangeNotifierProvaider<CreateEventsViewModel>,
                    CreateEventsViewModel>(context);
                if (newsModel?.selectedItems == null ||
                    newsModel?.selectedItems?.isEmpty == true) {
                  return;
                }
                context.octopus.setState((state) => state
                  ..findByName('create-news')
                      ?.add(Routes.createNewsDate.node()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarForCreateNews extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppBarForCreateNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              context.octopus
                  .setState((state) => state..removeByName('create-news'));
            },
            child: const Text('Сбросить'))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ResumeButtonWidget extends StatelessWidget {
  const ResumeButtonWidget(
      {super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return const Color.fromARGB(46, 94, 222, 102);
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 57)),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Theme.of(context).colorScheme.primary),
        ),
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: InkWell(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
        ),
      ),
    );
  }
}

class TypeListWidget extends StatefulWidget {
  const TypeListWidget({
    super.key,
  });

  @override
  _TypeListWidgetState createState() => _TypeListWidgetState();
}

class _TypeListWidgetState extends State<TypeListWidget> {
  List<String> selectedCategories = [];
  late final CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();
    _categoryBloc = context.read<CategoryBloc>();
    _categoryBloc.add(const CategoryEvent.fetch());
  }

  void selectItem(String item) {
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    setState(() {
      if (selectedCategories.contains(item)) {
        selectedCategories.remove(item);
      } else {
        selectedCategories.add(item);
      }
    });
    newsModel?.selectedItems = selectedCategories;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: _categoryBloc,
      builder: (context, state) {
        if (state is CategoryState$Error) {
          return const Center(child: Text('Error'));
        } else if (state is CategoryState$Processing) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          if (state.data!.isEmpty) {
            return const Center(child: Text('Список пуст.'));
          } else {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 34.0, left: 23.0, right: 23.0),
              child: Wrap(
                spacing: 14.0, // Расстояние между Chips
                runSpacing: 14.0, // Расстояние между строками Chips
                children: List.generate(
                  state.data!.length, // Количество Chips
                  (index) {
                    bool isSelected = selectedCategories
                        .contains(state.data![index].id.toString());

                    return GestureDetector(
                      onTap: () {
                        selectItem(state.data![index].id.toString());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.background,
                        ),
                        child: Text(
                          state.data![index].name,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }
      },
    );
  }
}
