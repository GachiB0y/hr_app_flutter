import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/caregory_bloc.dart/category_bloc.dart';
import 'package:intl/intl.dart';

class CreateNewsScreen extends StatelessWidget {
  const CreateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.background),
      body: SafeArea(
        child: WriteDescriptionNewsScreen(),
      ),
    );
  }
}

class WriteDescriptionNewsScreen extends StatelessWidget {
  WriteDescriptionNewsScreen({super.key});
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Опиши мероприятие',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: TextFormField(
            maxLines: 12,
            minLines: 5,
            controller: _titleController,
            decoration: InputDecoration(
              fillColor: const Color(0xfff5f5f5),
              filled: true,
              hintText: 'Введи описание, не забудь указать место проведения',
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
          onPressed: () {
            print('LOL2');
          },
        ),
      ],
    );
  }
}

/// Write Title News Screen

class WriteTitleNewsScreen extends StatelessWidget {
  WriteTitleNewsScreen({super.key});
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Напиши заголовок',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
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
          onPressed: () {
            print('LOL2');
          },
        ),
      ],
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
    return Column(
      children: [
        Center(
          child: Text(
            'Выбери время проведения',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
        ),
        CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (Duration value) {
            print(value);
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
          onPressed: () {
            print('Time');
          },
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Выбери дату мероприятия',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
        ),
        CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateChanged: (DateTime value) {
              print(value);
              setState(() {
                selectedDate = value;
              });
            }),
        const Spacer(),
        Center(
          child: Text(
            'Дата: ${formatter.format(selectedDate)}',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
        ),
        const SizedBox(height: 10),
        ResumeButtonWidget(
          onPressed: () {
            print('LOL2');
          },
        ),
      ],
    );
  }
}

/// Selected Type Widget

class SelectedTypeWidget extends StatelessWidget {
  const SelectedTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Выбери тип события',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
          ),
        ),
        const TypeListWidget(),
        const Spacer(),
        ResumeButtonWidget(
          onPressed: () {
            print('LOL');
          },
        ),
      ],
    );
  }
}

class ResumeButtonWidget extends StatelessWidget {
  const ResumeButtonWidget({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
      child: ElevatedButton(
        onPressed: () {},
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
          child: const InkWell(
            child: Text(
              'Продолжить',
              style: TextStyle(color: Colors.white, fontSize: 26),
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
    // TODO: implement initState
    super.initState();
    _categoryBloc = context.read<CategoryBloc>();
    _categoryBloc.add(const CategoryEvent.fetch());
  }

  void selectItem(String item) {
    setState(() {
      if (selectedCategories.contains(item)) {
        selectedCategories.remove(item);
      } else {
        selectedCategories.add(item);
      }
    });
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
        });
    // return blocCategory.state.when(
    //     loading: () {
    //       return const Center(
    //         child: CircularProgressIndicator.adaptive(),
    //       );
    //     },
    //     loaded: (listCategory) {
    //       return SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           children: listCategory.map((item) {
    //             bool isSelected =
    //                 widget.selectedCategories.contains(item.id.toString());

    //             return GestureDetector(
    //               onTap: () {
    //                 selectItem(item.id.toString());
    //               },
    //               child: Container(
    //                 padding: const EdgeInsets.all(10),
    //                 margin: const EdgeInsets.all(8),
    //                 decoration: BoxDecoration(
    //                   color: isSelected ? Colors.black : Colors.white,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Text(
    //                   item.name,
    //                   style: TextStyle(
    //                     color: isSelected ? Colors.white : Colors.black,
    //                   ),
    //                 ),
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //       );
    //     },
    //     error: () => const Text('Nothing found...'));
  }
}
