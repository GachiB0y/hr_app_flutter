import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/entity/history_operation_entity.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/theme/style_text.dart';
import 'package:hr_app_flutter/ui/components/app_bar_user_widget.dart';

import 'package:intl/intl.dart';

class GrassCoinScreen extends StatelessWidget {
  const GrassCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            context
                .read<WalletBloc>()
                .add(const WalletEvent.fetch(userToken: 'userToken'));
            return Future<void>.delayed(const Duration(milliseconds: 100));
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                backgroundColor: Colors.grey[200],
                surfaceTintColor: Colors.transparent,
                // expandedHeight: 100,
                leadingWidth: 70,
                leading: const Avatar(),
                toolbarHeight: 100,

                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Александр Волков',
                            style: StyleTextCustom.textNameUser),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: const TextSpan(
                              text: 'Менеджер по работе\n с клиентами',
                              style: StyleTextCustom.textJobUserGrey),
                        ),
                      ],
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(302),
                  child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: const BodyContentWidgetCoinScreen()),
                ),
              ),
              HistoryOperationCoinWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyContentWidgetCoinScreen extends StatefulWidget {
  const BodyContentWidgetCoinScreen({
    super.key,
  });

  @override
  State<BodyContentWidgetCoinScreen> createState() =>
      _BodyContentWidgetCoinScreenState();
}

class _BodyContentWidgetCoinScreenState
    extends State<BodyContentWidgetCoinScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<WalletBloc>()
        .add(const WalletEvent.fetch(userToken: 'userToken'));
  }

  @override
  Widget build(BuildContext context) {
    final blocWallet = context.watch<WalletBloc>();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: const Text(
            'Баланс Грасс-коинов на счёте',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    ColorsForWidget.colorGreen, BlendMode.srcATop),
                child: Image.asset(
                  'assets/images/grass_icon_main.png',
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              blocWallet.state.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (walletLoaded) {
                  return Text(
                    walletLoaded.balance.toString(),
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.w500),
                  );
                },
                error: () => const Text('Nothing found...'),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
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
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
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
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.sync,
                  size: 26,
                  color: Colors.black,
                ),
                label: const Text('Обменять',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black))),
            ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.card_giftcard,
                    size: 26, color: Colors.black),
                label: const Text('Подарить',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black))),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'История операций',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ],
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
                '-${widget.item.count.toString()}',
                style: const TextStyle(fontSize: 16),
              )
            : Text(
                '+${widget.item.count.toString()}',
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
        const SizedBox(
          width: 5,
        ),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
              ColorsForWidget.colorGreen, BlendMode.srcATop),
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
        date: DateTime.now().subtract(const Duration(days: 1)),
        name: 'Sanya Volkov',
        count: 228,
        isTransfer: false),
    HistoryOperationEntity(
        date: DateTime.now().subtract(const Duration(days: 1)),
        name: 'Sanya Volkov',
        count: 228,
        isTransfer: false),
    HistoryOperationEntity(
        date: DateTime.utc(2023, 07, 17),
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

  HistoryOperationCoinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupedListViewHistoryOperation(
      historyList: historyList,
    );
  }
}

class GroupedListViewHistoryOperation extends StatelessWidget {
  final List<HistoryOperationEntity> historyList;

  const GroupedListViewHistoryOperation({super.key, required this.historyList});

  bool compareDates(DateTime date1, DateTime date2) {
    // Установка времени на полночь для обоих дат
    DateTime date1OnlyDate = DateTime(date1.year, date1.month, date1.day);
    DateTime date2OnlyDate = DateTime(date2.year, date2.month, date2.day);

    return date1OnlyDate.isAtSameMomentAs(date2OnlyDate);
  }

  bool compareYesterday(DateTime date) {
    // Получение вчерашней даты
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));

    // Сравнение даты сегодня с вчерашней датой
    return compareDates(date, yesterday);
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    // Группировка элементов по дате
    Map<String, List<HistoryOperationEntity>> groups = {};
    historyList.forEach((item) {
      String dateString = DateFormat('d MMM EEE, y.').format(item.date);
      bool isSameDay = compareDates(today, item.date);
      bool isYesterday = compareYesterday(item.date);
      if (isSameDay) {
        dateString = 'Сегодня';
      } else if (isYesterday) {
        dateString = 'Вчера';
      }

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
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            height: 25,
            child: ListTile(
              title: Text(
                dateString,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: groupItems
                .map(
                  (item) => ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      item.isTransfer ? 'Перевод' : 'Зачисление',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: SizedBox(
                      width: 80,
                      height: 50,
                      child: TralingHistoryWidget(
                        item: item,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const Divider(),
        ],
      ));
    });

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: groupWidgets,
          );
        },
        childCount: 1,
      ),
    );
  }
}
