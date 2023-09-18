import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/blocs/coins_screen_view_model_bloc/coins_screen_view_model_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/entity/wallet/wallet.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/ui/components/app_bar/app_bar_user_widget.dart';
import 'package:hr_app_flutter/ui/components/app_bar/title_app_bar_widget.dart';

import 'package:intl/intl.dart';

@RoutePage()
class GrassCoinScreen extends StatefulWidget {
  const GrassCoinScreen({super.key});

  @override
  State<GrassCoinScreen> createState() => _GrassCoinScreenState();
}

class _GrassCoinScreenState extends State<GrassCoinScreen> {
  @override
  void initState() {
    super.initState();
    getInfoForInit();
  }

  void getInfoForInit() {
    context.read<WalletBloc>().add(const WalletEvent.fetch());
    context
        .read<CoinsScreenViewModelBloc>()
        .add(const CoinsScreenViewModelEvent.fetchInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: RefreshIndicator(
          color: ColorsForWidget.colorGreen,
          onRefresh: () {
            getInfoForInit();
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

                title: const TitleAppBarWidget(),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(360),
                  child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: const BodyContentWidgetCoinScreen()),
                ),
              ),
              const HistoryOperationCoinWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyContentWidgetCoinScreen extends StatelessWidget {
  const BodyContentWidgetCoinScreen({
    super.key,
  });

  void _showBottomSheet(BuildContext context, {required bool isCoinsInfo}) {
    showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: ColorsForWidget.colorGrey,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7, // Указывает высоту окна в относительных единицах
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: CardListCoinsInfoBottomSheet(
              isCoinsInfo: isCoinsInfo,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final blocWallet = context.watch<WalletBloc>();
    final blocUser = context.watch<UserBloc>();

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
              ),
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
              onPressed: () => _showBottomSheet(context, isCoinsInfo: true),
              icon: Container(
                decoration: BoxDecoration(
                    color: ColorsForWidget.colorGreen,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(Icons.question_mark_rounded,
                    size: 18, color: Colors.white),
              ),
              label: const Text(
                'Что такое коин и что с ним делать?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
              onPressed: () => _showBottomSheet(context, isCoinsInfo: false),
              icon: const Icon(
                MyCustomIcon.iconRub,
                size: 18,
                color: ColorsForWidget.colorGreen,
              ),
              label: const Text(
                'Как заработать коины?',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
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
                onPressed: () {
                  AutoRouter.of(context).push(SearchFriendAndSendCoinsRoute(
                      authRepository: blocUser.authRepository,
                      userRepo: blocUser.userRepo));
                },
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

  final Transaction item;
  @override
  State<TralingHistoryWidget> createState() => _TralingHistoryWidgetState();
}

class _TralingHistoryWidgetState extends State<TralingHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.item.typeTtransaction == 1
            ? Text(
                '-${widget.item.amount.toString()}',
                style: const TextStyle(fontSize: 16),
              )
            : Text(
                '+${widget.item.amount.toString()}',
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
  const HistoryOperationCoinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const GroupedListViewHistoryOperation();
  }
}

class GroupedListViewHistoryOperation extends StatelessWidget {
  const GroupedListViewHistoryOperation({super.key});

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
    final blocWallet = context.watch<WalletBloc>();
    return blocWallet.state.when(
      loading: () {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      loaded: (walletLoaded) {
        DateTime today = DateTime.now();
        // Группировка элементов по дате
        Map<String, List<Transaction>> groups = {};
        walletLoaded.transactions.forEach((item) {
          final DateTime date =
              DateTime.fromMillisecondsSinceEpoch(item.createAt * 1000);
          String dateString = DateFormat('d MMM EEE, y.').format(date);
          bool isSameDay = compareDates(today, date);
          bool isYesterday = compareYesterday(date);
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
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: groupItems
                    .map(
                      (item) => ListTile(
                        title: item.typeTtransaction == 0
                            ? Text(item.sender)
                            : Text(item.recipient),
                        subtitle: Text(
                          item.typeTtransaction == 0 ? 'Зачисление' : 'Перевод',
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
      },
      error: () => const SliverToBoxAdapter(child: Text('Nothing found...')),
    );
  }
}

class CardListCoinsInfoBottomSheet extends StatelessWidget {
  final bool isCoinsInfo;

  const CardListCoinsInfoBottomSheet({super.key, required this.isCoinsInfo});

  @override
  Widget build(BuildContext context) {
    final blocCoinsScreenViewModel = context.watch<CoinsScreenViewModelBloc>();

    return blocCoinsScreenViewModel.state.when(
      loaded: (listCoinsInfoLoaded, listCoinsRewardLoaded) {
        return isCoinsInfo
            ? ListView.builder(
                itemCount: listCoinsInfoLoaded.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        listCoinsInfoLoaded[index].title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Награда: ${listCoinsInfoLoaded[index].price.toString()}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(
                            MyCustomIcon.iconLogoGrass,
                            color: ColorsForWidget.colorGreen,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: listCoinsRewardLoaded.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        listCoinsRewardLoaded[index].title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Цена: ${listCoinsRewardLoaded[index].price.toString()}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Icon(
                            MyCustomIcon.iconLogoGrass,
                            color: ColorsForWidget.colorGreen,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: () => const SliverToBoxAdapter(child: Text('Nothing found...')),
    );
  }
}
