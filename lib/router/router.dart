import 'package:auto_route/auto_route.dart';
import 'package:hr_app_flutter/ui/screens/auth_screen.dart';
import 'package:hr_app_flutter/ui/screens/company_screen.dart';
import 'package:hr_app_flutter/ui/screens/education_screen.dart';
import 'package:hr_app_flutter/ui/screens/grass_coin_sreen/grass_coin_screen.dart';
import 'package:hr_app_flutter/ui/screens/loader_screen.dart';
import 'package:hr_app_flutter/ui/screens/main_app_screen.dart';
import 'package:hr_app_flutter/ui/screens/grass_coin_sreen/search_friend_and_send_coins_screen.dart';
import 'package:hr_app_flutter/ui/screens/services_screen.dart';
import 'package:hr_app_flutter/ui/screens/user_main_screen.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoaderRoute.page, path: '/'),
        AutoRoute(page: AuthenticationFormRoute.page, path: '/auth'),
        AutoRoute(page: MainAppRoute.page, path: '/main_screen', children: [
          AutoRoute(page: UserMainRoute.page, path: 'user_main'),
          AutoRoute(page: GrassCoinRoute.page, path: 'coin'),
          AutoRoute(page: ServicesRoute.page, path: 'services'),
          AutoRoute(page: EducationRoute.page, path: 'education'),
          AutoRoute(page: CompanyRoute.page, path: 'company'),
        ]),
        AutoRoute(
            page: SearchFriendAndSendCoinsRoute.page,
            path: '/search_friend_and_send_coins'),
      ];
}
