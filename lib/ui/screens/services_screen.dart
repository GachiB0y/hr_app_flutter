// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/domain/entity/event_entity.dart';
import 'package:hr_app_flutter/domain/entity/image.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({
    Key? key,
  }) : super(key: key);

  void openBottomSheet(
      BuildContext context,
      MainAppScreenViewCubit cubitMainAppScreen,
      EventEntityCubit cubitEventEntity) {
    showModalBottomSheet(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize:
              0.8, // Измените это значение, чтобы задать начальный размер листа
          minChildSize:
              0.8, // Измените это значение, чтобы задать минимальный размер листа
          maxChildSize:
              1.0, // Измените это значение, чтобы задать максимальный размер листа
          expand: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          height: 26,
                        ),
                      ),
                      Container(
                        height: 26,
                        width: 52,
                        child: CustomPaint(
                          // size: Size(50, 50),
                          painter: PainterLeft(),
                        ),
                      ),
                      Container(
                        width: 25.0,
                        height: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      Container(
                        // Контейнер "летающей" ручки
                        width: 50.0,
                        height: 5.0,

                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      Container(
                        width: 25.0,
                        height: 5.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      Container(
                        height: 26,
                        width: 52,
                        child: CustomPaint(
                          // size: Size(50, 50),
                          painter: PainterRight(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20.0)),
                      ),
                      child: BottomSheetCreateEventsWidget(
                        cubit: cubitEventEntity,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      cubitMainAppScreen.changeVisibleBottomBar(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubitMainAppScreen = context.watch<MainAppScreenViewCubit>();
    final cubitEventEntity = context.watch<EventEntityCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: const Text(
                'События',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                  onPressed: () {
                    cubitMainAppScreen.changeVisibleBottomBar(true);

                    openBottomSheet(
                        context, cubitMainAppScreen, cubitEventEntity);
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 35,
                    color: ColorsForWidget.colorGreen,
                  )),
            ),
          ),
        ],
      )),
    );
  }
}

class PainterRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 100;
    double x = 52;
    double y = 26;
    final path = Path()
      ..moveTo(0, size.height) // Начало пути
      ..arcToPoint(Offset(size.width - y + 5, y / 3),
          radius: Radius.circular(
            x,
          ),
          clockwise: false)
      ..arcToPoint(
        Offset(size.width, 0),
        radius: Radius.elliptical(x, x),
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width,
          size.height) // Добавить линию, образующую правую стенку контейнера
      ..close(); // Замкнуть контур, создав обрезанный прямоугольник
    final paint = Paint()
      ..color = const Color.fromARGB(255, 224, 224, 224)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PainterLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 100;
    double x = 52;
    double y = 26;
    final path = Path()
      ..moveTo(size.width, size.height) // Начало пути
      ..arcToPoint(
        Offset(size.width - y - 5, y / 3),
        radius: Radius.elliptical(x, y),
      )
      ..arcToPoint(Offset(0, 0), radius: Radius.circular(x), clockwise: false)
      ..lineTo(0, 0)
      ..lineTo(
          0, size.height) // Добавить линию, образующую правую стенку контейнера
      ..close(); // Замкнуть контур, создав обрезанный прямоугольник
    final paint = Paint()
      ..color = const Color.fromARGB(255, 224, 224, 224)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BottomSheetCreateEventsWidget extends StatefulWidget {
  EventEntityCubit cubit;
  BottomSheetCreateEventsWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<BottomSheetCreateEventsWidget> createState() =>
      _BottomSheetCreateEventsWidgetState();
}

class _BottomSheetCreateEventsWidgetState
    extends State<BottomSheetCreateEventsWidget> {
  int selectedTab = 0;
  final List<String> tabs = [
    'Актуальное',
    'Новости',
    'Сотрудники',
    'Мероприятия'
  ];
  TextEditingController dataDescriptionController = TextEditingController();
  TextEditingController dataTitleController = TextEditingController();
  TextEditingController dateRangeController = TextEditingController();
  List<String> selectedItems = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.5,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Создать событие',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: MyPickerImage(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Тип события',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
              ScrollWidget(
                selectedItems: selectedItems,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: DateRangePickerWidget(
                  dateRangeController: dateRangeController,
                  endDate: endDate,
                  startDate: startDate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFieldTitleWidget(
                    dataTitleController: dataTitleController),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFieldDescriptionWidget(
                    dataDescriptionController: dataDescriptionController),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorsForWidget.colorGreen),
                    ),
                    child: const Text(
                      'Создать',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      final event = EventEntity(
                          title: dataTitleController.text,
                          description: dataDescriptionController.text,
                          imagePath:
                              'https://media.istockphoto.com/id/1309352410/ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%87%D0%B8%D0%B7%D0%B1%D1%83%D1%80%D0%B3%D0%B5%D1%80-%D1%81-%D0%BF%D0%BE%D0%BC%D0%B8%D0%B4%D0%BE%D1%80%D0%B0%D0%BC%D0%B8-%D0%B8-%D1%81%D0%B0%D0%BB%D0%B0%D1%82%D0%BE%D0%BC-%D0%BD%D0%B0-%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8F%D0%BD%D0%BD%D0%BE%D0%B9-%D0%B4%D0%BE%D1%81%D0%BA%D0%B5.jpg?s=612x612&w=0&k=20&c=dW1Aguo-4PEcRs79PUbmMXpx5YrBjqSYiEhwnddbj_g=',
                          dateFrom: DateTime.now(),
                          dateTo: DateTime.now(),
                          tags: selectedItems);

                      widget.cubit.addItem(event);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldTitleWidget extends StatelessWidget {
  const TextFieldTitleWidget({
    super.key,
    required this.dataTitleController,
  });

  final TextEditingController dataTitleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 256,
      controller: dataTitleController,
      decoration: const InputDecoration(
        labelStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
        labelText: 'Заголовок',
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class TextFieldDescriptionWidget extends StatelessWidget {
  const TextFieldDescriptionWidget({
    super.key,
    required this.dataDescriptionController,
  });

  final TextEditingController dataDescriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: dataDescriptionController,
      decoration: const InputDecoration(
        labelStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
        labelText: 'Описание',
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ScrollWidget extends StatefulWidget {
  List<String> selectedItems;
  ScrollWidget({super.key, required this.selectedItems});

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  List<String> items = ['Актуальное', 'Новости', 'Сотрудники', 'Мероприятия'];

  void selectItem(String item) {
    setState(() {
      if (widget.selectedItems.contains(item)) {
        widget.selectedItems.remove(item);
      } else {
        widget.selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          bool isSelected = widget.selectedItems.contains(item);

          return GestureDetector(
            onTap: () {
              selectItem(item);
              print(widget.selectedItems);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DateRangePickerWidget extends StatefulWidget {
  final TextEditingController dateRangeController;
  DateTime startDate;
  DateTime endDate;

  DateRangePickerWidget(
      {super.key,
      required this.dateRangeController,
      required this.startDate,
      required this.endDate});
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  Future<void> selectDateRange(BuildContext context) async {
    final pickedDates = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: widget.startDate != null && widget.endDate != null
          ? DateTimeRange(start: widget.startDate, end: widget.endDate)
          : null,
    );

    if (pickedDates != null) {
      setState(() {
        widget.startDate = pickedDates.start;
        widget.endDate = pickedDates.end;
        updateDateRangeText();
      });
    }
  }

  void updateDateRangeText() {
    final formatter = DateFormat('d MMM');
    String start = widget.startDate != null
        ? formatter.format(widget.startDate)
        : 'Start Date';
    String end =
        widget.endDate != null ? formatter.format(widget.endDate) : 'End Date';
    String dateRangeText = '$start - $end';
    widget.dateRangeController.text = dateRangeText;
  }

  @override
  void dispose() {
    widget.dateRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectDateRange(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: widget.dateRangeController,
          decoration: const InputDecoration(
            labelStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
            labelText: 'Время проведения',
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class MyPickerImage extends StatefulWidget {
  const MyPickerImage({Key? key}) : super(key: key);

  @override
  _MyPickerImageState createState() => _MyPickerImageState();
}

class _MyPickerImageState extends State<MyPickerImage> {
  final MyImage _myImage = MyImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _myImage.imageFile != null
            ? Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: _myImage.imageFile != null
                        ? FileImage(_myImage.imageFile as File)
                        : const NetworkImage(
                                'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg')
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: InkWell(
            onTap: () async {
              await _myImage.pickImage(ImageSource.gallery);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
