import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/core/utils/international_phone_formatter.dart';

import '../../../user/bloc/other_users_bloc/other_users_bloc.dart';
import '../../bloc/wallet_bloc/wallet_bloc.dart';

class SearchFriendAndSendCoinsScreen extends StatefulWidget {
  const SearchFriendAndSendCoinsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SearchFriendAndSendCoinsScreenState createState() =>
      _SearchFriendAndSendCoinsScreenState();
}

class _SearchFriendAndSendCoinsScreenState
    extends State<SearchFriendAndSendCoinsScreen> {
  String phoneNumber = '';
  String amountCoins = '';
  late final OtherUsersBloc _otherUsersBloc;

  @override
  void initState() {
    super.initState();
    _otherUsersBloc = OtherUsersBloc(
        authRepository: DependenciesScope.of(context).authRepository,
        userRepo: DependenciesScope.of(context).userRepository);
  }

  void showPopupWindow(int autoCard) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Введите сумму'),
          content: TextField(
            decoration: const InputDecoration(
              labelText: 'Количество',
            ),
            onChanged: (value) {
              setState(() {
                amountCoins = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                final blocWallet = context.read<WalletBLoC>();
                blocWallet.add(WalletEvent.sendCoinsToOtherUser(
                    amount: int.parse(amountCoins),
                    userId: autoCard,
                    message: 'LOL'));
                blocWallet.add(const WalletEvent.fetch());

                /// Закрыть Алерт.
                Navigator.of(context).pop();

                /// Закрть последнюю вкладку.
                Navigator.of(context).pop();
              },
              child: const Text('Подтвердить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TextField(
          keyboardType: TextInputType.phone,
          inputFormatters: [InternationalPhoneFormatter()],
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                final formattedPhoneNumber =
                    phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
                _otherUsersBloc.add(OtherUsersEvent.gethUsersByPhoneNumber(
                    phoneNumber: formattedPhoneNumber));
              },
              icon: const Icon(Icons.search),
            ),
            hintText: '+7 (___) ___-__-__',
            filled: true,
            fillColor: Colors.white,
            border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          onChanged: (value) {
            setState(() {
              phoneNumber = value;
            });
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Найденные пользователи:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            _ResultSearchWidget(
              callbackShowPopupWindow: showPopupWindow,
            )
          ],
        ),
      ),
    );
  }
}

class _ResultSearchWidget extends StatelessWidget {
  const _ResultSearchWidget({super.key, required this.callbackShowPopupWindow});
  final Function(int) callbackShowPopupWindow;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherUsersBloc, OtherUsersState>(
        builder: (context, state) {
      if (state is OtherUsersState$Processing) {
        return const SizedBox.shrink();
      } else if (state is OtherUsersState$Error) {
        return const Center(child: Text('Пользователь не найден.'));
      } else {
        if (state.data != null) {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      '${state.data![index].nameI} ${state.data![index].name}'),
                  subtitle: Text(state.data![index].staffPosition),
                  onTap: () {
                    callbackShowPopupWindow(state.data![index].autoCard);
                  },
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('Пользователь не найден.'));
        }
      }
    });
  }
}
