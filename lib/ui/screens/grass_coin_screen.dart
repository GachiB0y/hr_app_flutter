import 'package:flutter/material.dart';
import 'package:hr_app_flutter/domain/entity/history_operation_entity.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/ui/components/app_bar_user_widget.dart';
import 'package:intl/intl.dart';

class GrassCoinScreen extends StatelessWidget {
  const GrassCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width / 16;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const AppBarUserWdiget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Баланс Грасс-коинов на счёте',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.orange, BlendMode.srcATop),
                      child: Image.asset(
                        'assets/images/grass_icon_main.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '256',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 45,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '56',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'за неделю',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                    width: double.infinity,
                  ),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                      ),
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(
                            color: ColorsForWidget.colorGreen,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(Icons.question_mark_rounded,
                            size: 18, color: Colors.white),
                      ),
                      label: const Text('Что такое коин и что с ним делать?',
                          style: TextStyle(fontSize: 16, color: Colors.black))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(28)),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sync,
                        size: 28,
                        color: Colors.black,
                      ),
                      label: const Text('Обменять',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                  ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(28)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.card_giftcard,
                          size: 28, color: Colors.black),
                      label: const Text('Подарить',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black))),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'История операций',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: HistoryOperationCoinWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class TralingHistoryWidget extends StatefulWidget {
  const TralingHistoryWidget({
    super.key,
    required this.item,
  });

  final HistoryOperationEntity item;
  @override
  State<TralingHistoryWidget> createState() => _TralingHistoryWidgetState();
}

class _TralingHistoryWidgetState extends State<TralingHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.item.isTransfer
            ? Text(
                '+${widget.item.count.toString()}',
                style: TextStyle(color: Colors.green, fontSize: 16),
              )
            : Text(
                '-${widget.item.count.toString()}',
                style: TextStyle(fontSize: 16),
              ),
        const SizedBox(
          width: 5,
        ),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcATop),
          child: Image.asset(
            'assets/images/grass_icon_main.png',
            width: 15,
            height: 15,
          ),
        ),
      ],
    );
  }
}

class HistoryOperationCoinWidget extends StatelessWidget {
  final List<HistoryOperationEntity> historyList = [
    HistoryOperationEntity(
        date: DateTime.now(), name: 'Sanya Volkov', count: 1, isTransfer: true),
    HistoryOperationEntity(
        date: DateTime.now(),
        name: 'Sanya Volkov',
        count: 2,
        isTransfer: false),
    HistoryOperationEntity(
        date: DateTime.utc(2023, 07, 16),
        name: 'Sanya Volkov',
        count: 100,
        isTransfer: true),
    HistoryOperationEntity(
        date: DateTime.utc(2023, 07, 16),
        name: 'Sanya Volkov',
        count: 222,
        isTransfer: true),
    HistoryOperationEntity(
        date: DateTime.utc(2023, 07, 15),
        name: 'Vasya Pupkin',
        count: 50,
        isTransfer: false),
  ];

  @override
  Widget build(BuildContext context) {
    return GroupedListViewHistoryOperation(
      historyList: historyList,
    );
  }
}

class GroupedListViewHistoryOperation extends StatelessWidget {
  final List<HistoryOperationEntity> historyList;

  GroupedListViewHistoryOperation({required this.historyList});

  @override
  Widget build(BuildContext context) {
    // Группировка элементов по дате
    Map<String, List<HistoryOperationEntity>> groups = {};
    historyList.forEach((item) {
      String dateString = DateFormat('yyyy-MM-dd').format(item.date);
      if (groups[dateString] == null) {
        groups[dateString] = [];
      }
      groups[dateString]?.add(item);
    });

    // Создание списка групп
    List<Widget> groupWidgets = [];
    groups.forEach((dateString, groupItems) {
      groupWidgets.add(Column(
        children: [
          ListTile(
            title: Text(dateString),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: groupItems
                .map(
                  (item) => ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                        item.isTransfer ? 'Перевод' : 'Зачисление',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: SizedBox(
                        width: 80,
                        height: 50,
                        child: TralingHistoryWidget(
                          item: item,
                        ),
                      )),
                )
                .toList(),
          ),
          Divider(),
        ],
      ));
    });

    return SingleChildScrollView(
      child: Column(
        children: groupWidgets,
      ),
    );
  }
}
