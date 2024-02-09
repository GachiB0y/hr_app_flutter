import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/user_main_screen.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';
import '../../bloc/coins_screen_view_model_bloc/coins_screen_view_model_bloc.dart';
import '../../bloc/wallet_bloc/wallet_bloc.dart';
import '../../model/wallet/wallet.dart';

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
    context.read<WalletBLoC>().add(const WalletEvent.fetch());
    context
        .read<CoinsScreenViewModelBloc>()
        .add(const CoinsScreenViewModelEvent.fetchInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: Theme.of(context).colorScheme.primary,
          onRefresh: () {
            getInfoForInit();
            return Future<void>.delayed(const Duration(milliseconds: 100));
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF00C8E0), Color(0xFF00D000)],
                      ),
                      borderRadius: BorderRadius.circular(63),
                    ),
                    child: BlocBuilder<WalletBLoC, WalletState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 22.0, right: 22.0, bottom: 8.0),
                          child: Text(
                            '${state.data == null ? '0' : state.data!.balance} coin',
                            style: const TextStyle(
                                fontSize: 37,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFF00C8E0), Color(0xFF00D000)],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds),
                    child: const Text(
                      'количество твоих коинов',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 23,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Операция с коинами",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 7.0,
                  child: const CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: <Widget>[OperationsWithCoinScrollBarWidget()],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 35,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "История операций",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25, top: 25.0),
                  child: HistoryOperationWidget(),
                ),
              )

              // SliverAppBar(
              //   pinned: true,
              //   snap: true,
              //   floating: true,
              //   backgroundColor: Theme.of(context).colorScheme.background,
              //   surfaceTintColor: Colors.transparent,
              //   leadingWidth: 90,
              //   leading: const Avatar(),
              //   toolbarHeight: 90,
              //   title: const TitleAppBarWidget(),
              //   bottom: PreferredSize(
              //     preferredSize: const Size.fromHeight(360),
              //     child: Container(
              //         padding: const EdgeInsets.only(left: 20, right: 20),
              //         child: const BodyContentWidgetCoinScreen()),
              //   ),
              // ),
              // const HistoryOperationCoinWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class OperationsWithCoinScrollBarWidget extends StatefulWidget {
  const OperationsWithCoinScrollBarWidget({
    super.key,
  });

  @override
  State<OperationsWithCoinScrollBarWidget> createState() =>
      _OperationsWithCoinScrollBarWidgetState();
}

class _OperationsWithCoinScrollBarWidgetState
    extends State<OperationsWithCoinScrollBarWidget> {
  final List<Widget> groupWidgets = [
    const ElementOperationsWithCoinsWidget(
      imagePath: 'assets/images/hot-beverage.png',
      index: 0,
      title: 'На что потратить?',
    ),
    const ElementOperationsWithCoinsWidget(
      imagePath: 'assets/images/person-shrugging.png',
      index: 1,
      title: 'Как получить больше?',
    ),
    const ElementOperationsWithCoinsWidget(
      imagePath: 'assets/images/recycling-symbol.png',
      index: 2,
      title: 'Обменять на пропуск',
    ),
    const ElementOperationsWithCoinsWidget(
      imagePath: 'assets/images/party-popper_big.png',
      index: 3,
      title: 'Подарить другу',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final double leftPadding = index == 0 ? 25.0 : 8.0;
          final double rightPadding = index == groupWidgets.length ? 25.0 : 8.0;
          return Padding(
            padding: EdgeInsets.only(
                left: leftPadding, right: rightPadding, top: 10, bottom: 10),
            child: groupWidgets[index],
          );
        },
        childCount: groupWidgets.length,
      ),
    );
  }
}

/// {@template grass_coin_screen}
/// ElementOperationsWithCoinsWidget widget.
/// {@endtemplate}
class ElementOperationsWithCoinsWidget extends StatelessWidget {
  /// {@macro grass_coin_screen}
  const ElementOperationsWithCoinsWidget(
      {super.key,
      required this.index,
      required this.title,
      required this.imagePath});
  final int index;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    const double radius = 18.0;
    final sizeScreen = MediaQuery.of(context).size;

    final sizeWidhtIsRow = (sizeScreen.width / 3.6);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(radius),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          width: sizeWidhtIsRow,
          height: (MediaQuery.of(context).size.height / 8.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 16.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                textAlign: TextAlign.left,
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: sizeWidhtIsRow,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
        ),
        SizedBox(
          width: sizeWidhtIsRow,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: () async {
                if (index == 0) {
//TODO маршрут на что потратить коины?
                } else if (index == 1) {
//TODO маршрут на как получить больше?
                } else if (index == 2) {
//TODO маршрут на обменять на пропуск
                } else if (index == 3) {
                  ///Маршрут на подарить другу
                  Octopus.of(context).push(Routes.searchFriendAndSendCoins);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class HistoryOperationWidget extends StatelessWidget {
  const HistoryOperationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBLoC, WalletState>(builder: (context, state) {
      if (state is WalletState$Processing) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else if (state is WalletState$Error) {
        return const Center(child: Text('Ошибка загрузки'));
      } else {
        if (state.data == null) {
          return const Center(child: Text('Ошибка. Данных нет.'));
        } else if (state.data!.transactions == null) {
          return const Center(child: Text('Ошибка. Транзакций нет.'));
        } else {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data!.transactions!.length,
              itemBuilder: (BuildContext context, int index) {
                return ElementHistoryOperationWidget(
                  item: state.data!.transactions![index],
                );
              });
        }
      }
    });
  }
}

class ElementHistoryOperationWidget extends StatelessWidget {
  const ElementHistoryOperationWidget({super.key, required this.item});
  final Transaction item;

  @override
  Widget build(BuildContext context) {
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(item.createAt * 1000);
    String dateString = DateFormat('dd.MM').format(date);
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
          Text(
            dateString,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.typeTtransaction == 0 ? 'Зачисление' : 'Перевод',
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              Text(item.typeTtransaction == 0 ? item.sender : item.recipient),
            ],
          ),
          const Spacer(),
          item.typeTtransaction == 1
              ? Text(
                  '-${item.amount.toString()}',
                  style: const TextStyle(
                      fontSize: 29, fontWeight: FontWeight.w700),
                )
              : Text(
                  '+${item.amount.toString()}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 29,
                      fontWeight: FontWeight.w700),
                ),
        ],
      ),
    );
  }
}

// class _CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return const BodyContentWidgetCoinScreen();
//   }

//   @override
//   double get maxExtent => 360; // Максимальная высота шапки

//   @override
//   double get minExtent => 360; // Минимальная высота шапки

//   @override
//   bool shouldRebuild(_CustomHeaderDelegate oldDelegate) {
//     return false;
//   }
// }

// class BodyContentWidgetCoinScreen extends StatefulWidget {
//   const BodyContentWidgetCoinScreen({
//     super.key,
//   });

//   @override
//   State<BodyContentWidgetCoinScreen> createState() =>
//       _BodyContentWidgetCoinScreenState();
// }

// class _BodyContentWidgetCoinScreenState
//     extends State<BodyContentWidgetCoinScreen> {
//   String amountCoins = '';
//   void _showBottomSheet(BuildContext context, {required bool isCoinsInfo}) {
//     showModalBottomSheet(
//       showDragHandle: true,
//       backgroundColor: Theme.of(context).colorScheme.outline,
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return FractionallySizedBox(
//           heightFactor: 0.7, // Указывает высоту окна в относительных единицах
//           child: Container(
//             margin: const EdgeInsets.only(left: 16, right: 16),
//             child: CardListCoinsInfoBottomSheet(
//               isCoinsInfo: isCoinsInfo,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void showPopupWindow() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Введите сумму'),
//           content: TextField(
//             decoration: const InputDecoration(
//               labelText: 'Количество',
//             ),
//             onChanged: (value) {
//               setState(() {
//                 amountCoins = value;
//               });
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 final blocWallet = context.read<WalletBLoC>();
//                 blocWallet.add(
//                   WalletEvent.sendCoinsToBracer(
//                     amount: int.parse(amountCoins),
//                   ),
//                 );
//                 Navigator.of(context).pop(); // Закрыть Алерт
//               },
//               child: const Text('Подтвердить'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double textScaleFactor = MediaQuery.of(context).textScaleFactor;
//     if (textScaleFactor < 1) textScaleFactor = 1;

//     return SizedBox(
//       height: (360 * textScaleFactor),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           const Text(
//             'Баланс Грасс-коинов на счёте',
//             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RowBalanceCountWidget(),
//                 RowAvarageCoinCountWidget(),
//               ]),
//           const SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints.tightFor(
//                 width: double.infinity,
//               ),
//               child: ElevatedButton.icon(
//                 style: ButtonStyle(
//                   backgroundColor: const MaterialStatePropertyAll(Colors.white),
//                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30))),
//                   padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
//                 ),
//                 onPressed: () => _showBottomSheet(context, isCoinsInfo: true),
//                 icon: Container(
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.primary,
//                       borderRadius: BorderRadius.circular(30)),
//                   child: const Icon(Icons.question_mark_rounded,
//                       size: 18, color: Colors.white),
//                 ),
//                 label: const Text(
//                   'Что такое коин и что с ним делать?',
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints.tightFor(
//                 width: double.infinity,
//               ),
//               child: ElevatedButton.icon(
//                 style: ButtonStyle(
//                   backgroundColor: const MaterialStatePropertyAll(Colors.white),
//                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30))),
//                   padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
//                 ),
//                 onPressed: () => _showBottomSheet(context, isCoinsInfo: false),
//                 icon: Icon(
//                   MyCustomIcon.iconRub,
//                   size: 18,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//                 label: const Text(
//                   'Как заработать коины?',
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton.icon(
//                   style: ButtonStyle(
//                     backgroundColor:
//                         const MaterialStatePropertyAll(Colors.white),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30))),
//                     padding:
//                         MaterialStateProperty.all(const EdgeInsets.all(16)),
//                   ),
//                   onPressed: () {
//                     showPopupWindow(); // Вызов окна для перевода коина на браслет
//                   },
//                   icon: const Icon(
//                     Icons.sync,
//                     size: 26,
//                     color: Colors.black,
//                   ),
//                   label: const Text('На браслет',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.black))),
//               ElevatedButton.icon(
//                   style: ButtonStyle(
//                     backgroundColor:
//                         const MaterialStatePropertyAll(Colors.white),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30))),
//                     padding:
//                         MaterialStateProperty.all(const EdgeInsets.all(16)),
//                   ),
//                   onPressed: () {
//                     Octopus.of(context).push(Routes.searchFriendAndSendCoins);
//                   },
//                   icon: const Icon(Icons.card_giftcard,
//                       size: 26, color: Colors.black),
//                   label: const Text('Подарить',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w300,
//                           color: Colors.black))),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             'История операций',
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RowAvarageCoinCountWidget extends StatelessWidget {
//   const RowAvarageCoinCountWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WalletBLoC, WalletState>(builder: (context, state) {
//       return Padding(
//         padding: const EdgeInsets.only(right: 20),
//         child: Row(
//           children: [
//             const Icon(
//               Icons.add_circle_outline,
//               size: 45,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 switch (state) {
//                   WalletState$Idle(:final data) => Text(
//                       data != null
//                           ? data.avarageCoins.toString()
//                           : 'Ничего не найденно...',
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                   WalletState$Processing _ => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   WalletState$Successful(:final data) => Text(
//                       data != null
//                           ? data.avarageCoins.toString()
//                           : 'Ничего не найденно...',
//                       style: const TextStyle(fontSize: 20),
//                     ),
//                   WalletState$Error _ => const Text('Ничего не найденно...'),
//                   _ => const Text('Default'),
//                 },
//                 Text(
//                   'за неделю',
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.outline),
//                 )
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// class RowBalanceCountWidget extends StatelessWidget {
//   const RowBalanceCountWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WalletBLoC, WalletState>(builder: (context, state) {
//       return Row(
//         children: [
//           ColorFiltered(
//             colorFilter: ColorFilter.mode(
//                 Theme.of(context).colorScheme.primary, BlendMode.srcATop),
//             child: Image.asset(
//               'assets/images/grass_icon_main.png',
//               width: 40,
//               height: 40,
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           switch (state) {
//             WalletState$Idle(:final data) => Text(
//                 data != null
//                     ? data.balance.toString()
//                     : 'Ничего не найденно...',
//                 style: data != null
//                     ? const TextStyle(fontSize: 40, fontWeight: FontWeight.w500)
//                     : null,
//               ),
//             WalletState$Processing() => const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             WalletState$Successful(:final data) => Text(
//                 data != null
//                     ? data.balance.toString()
//                     : 'Ничего не найденно...',
//                 style: data != null
//                     ? const TextStyle(fontSize: 40, fontWeight: FontWeight.w500)
//                     : null,
//               ),
//             WalletState$Error() => const Text('Ничего не найденно...'),
//             _ => const Text('Default'),
//           }
//         ],
//       );
//     });
//   }
// }

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
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary, BlendMode.srcATop),
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
    return BlocBuilder<WalletBLoC, WalletState>(builder: (context, state) {
      if (state.data?.transactions != null) {
        DateTime today = DateTime.now();
        // Группировка элементов по дате
        Map<String, List<Transaction>> groups = {};
        state.data!.transactions?.forEach((item) {
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
          groupWidgets.add(
            Column(
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
                            item.typeTtransaction == 0
                                ? 'Зачисление'
                                : 'Перевод',
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
            ),
          );
        });
        return switch (state) {
          WalletState$Idle() => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: groupWidgets,
                  );
                },
                childCount: 1,
              ),
            ),
          WalletState$Processing() => const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          WalletState$Successful() =>
            const SliverToBoxAdapter(child: Text('Состояние Successful.')),
          WalletState$Error() =>
            const SliverToBoxAdapter(child: Text('Ничего не найденно...')),
          _ => const Text('Default'),
        };
      } else {
        return const SliverToBoxAdapter(
            child: Center(child: Text('Ничего не найдено')));
      }
    });
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
                          Icon(
                            MyCustomIcon.iconLogoGrass,
                            color: Theme.of(context).colorScheme.primary,
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
                          Icon(
                            MyCustomIcon.iconLogoGrass,
                            color: Theme.of(context).colorScheme.primary,
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
