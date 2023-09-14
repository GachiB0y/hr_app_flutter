import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/ui/screens/service_screen.dart/my_picker_image.dart';
import 'package:intl/intl.dart';
import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

@RoutePage()
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({
    Key? key,
  }) : super(key: key);

  void openBottomSheet(
    BuildContext context,
    MainAppScreenViewCubit cubitMainAppScreen,
  ) {
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
                      SizedBox(
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
                      SizedBox(
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
                      child: const BottomSheetCreateEventsWidget(),
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
                      context,
                      cubitMainAppScreen,
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 35,
                    color: ColorsForWidget.colorGreen,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: const Text(
                'Модерация новстей',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const ApproveNewsRoute());
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
    // double radius = 100;
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
    // double radius = 100;
    double x = 52;
    double y = 26;
    final path = Path()
      ..moveTo(size.width, size.height) // Начало пути
      ..arcToPoint(
        Offset(size.width - y - 5, y / 3),
        radius: Radius.elliptical(x, y),
      )
      ..arcToPoint(const Offset(0, 0),
          radius: Radius.circular(x), clockwise: false)
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
  const BottomSheetCreateEventsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetCreateEventsWidget> createState() =>
      _BottomSheetCreateEventsWidgetState();
}

class _BottomSheetCreateEventsWidgetState
    extends State<BottomSheetCreateEventsWidget> {
  final TextEditingController dataDescriptionController =
      TextEditingController();
  final TextEditingController dataTitleController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();
  List<String> selectedItems = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String? base64Image;
  foundation.Uint8List? bytesSend;
  String errorMessage = '';
  File? file;

  Future<void> changeParams(File openFile) async {
    setState(() {
      file = openFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final blocEventEntity = context.read<EventEntityBloc>();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: MyPickerImage(
                  callback: changeParams,
                ),
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
                selectedCategories: selectedItems,
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
              errorMessage != ''
                  ? Center(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink(),
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
                      if (dataDescriptionController.text.isEmpty ||
                          dataTitleController.text.isEmpty ||
                          dateRangeController.text.isEmpty ||
                          selectedItems.isEmpty) {
                        setState(() {
                          errorMessage = 'Заполните все поля!!!';
                        });
                        return;
                      }

                      blocEventEntity.add(EventEntityEvent.createNewEventEntity(
                          title: dataTitleController.text,
                          description: dataDescriptionController.text,
                          imageFile: file!,
                          categories: selectedItems,
                          startDate: startDate.toString(),
                          endDate: endDate.toString()));
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
  final List<String> selectedCategories;
  const ScrollWidget({super.key, required this.selectedCategories});

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  void selectItem(String item) {
    setState(() {
      if (widget.selectedCategories.contains(item)) {
        widget.selectedCategories.remove(item);
      } else {
        widget.selectedCategories.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final blocCategory = context.watch<CategoryBloc>();
    return blocCategory.state.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
        loaded: (listCategory) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: listCategory.map((item) {
                bool isSelected =
                    widget.selectedCategories.contains(item.id.toString());

                return GestureDetector(
                  onTap: () {
                    selectItem(item.id.toString());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
        error: () => const Text('Nothing found...'));
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
