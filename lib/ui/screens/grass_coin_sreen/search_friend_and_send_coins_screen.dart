import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/utils/international_phone_formatter.dart';

@RoutePage()
class SearchFriendAndSendCoinsScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const SearchFriendAndSendCoinsScreen(
      {Key? key, required this.authRepository, required this.userRepo})
      : super(key: key);
  final IAuthRepository authRepository;
  final IUserRepository userRepo;
  @override
  _SearchFriendAndSendCoinsScreenState createState() =>
      _SearchFriendAndSendCoinsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OtherUsersBloc>(
      create: (BuildContext context) =>
          OtherUsersBloc(authRepository: authRepository, userRepo: userRepo),
      child: this,
    );
  }
}

class _SearchFriendAndSendCoinsScreenState
    extends State<SearchFriendAndSendCoinsScreen> {
  String phoneNumber = '';
  String amountCoins = '';

  @override
  void initState() {
    super.initState();
    context.read<OtherUsersBloc>().add(const OtherUsersEvent.clearList());
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

                Navigator.of(context).pop(); // Закрыть Алерт
                Navigator.of(context).pop(); // Закрть последнюю вкладку
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
    final blocOtherUsers = context.watch<OtherUsersBloc>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: ColorsForWidget.colorGreen,
        title: TextField(
          keyboardType: TextInputType.phone,
          inputFormatters: [InternationalPhoneFormatter()],
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                final formattedPhoneNumber =
                    phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
                blocOtherUsers.add(OtherUsersEvent.gethUsersByPhoneNumber(
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
            blocOtherUsers.state.when(
              loaded: (listUsersLoaded, currentUserProfile) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listUsersLoaded.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            '${listUsersLoaded[index].nameI} ${listUsersLoaded[index].name}'),
                        subtitle: Text(listUsersLoaded[index].staffPosition),
                        onTap: () {
                          showPopupWindow(listUsersLoaded[index].autoCard);
                        },
                      );
                    },
                  ),
                );
              },
              loading: (listUsersLoaded, currentUserProfile) {
                return const SizedBox.shrink();
              },
              error: (e) => const SafeArea(
                  child: Center(child: Text('Пользователь не найден.'))),
            )
          ],
        ),
      ),
    );
  }
}
