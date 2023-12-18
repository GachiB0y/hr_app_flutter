import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/features/services/widget/bag_report_screen/bag_report_screen.dart';
import 'package:hr_app_flutter/features/services/widget/booking_mettings_screens/first_screen_booking_meetings.dart';
import 'package:hr_app_flutter/features/services/widget/booking_mettings_screens/second_screen_booking_meeting.dart';
import 'package:hr_app_flutter/features/home/widget/company_screen.dart';
import 'package:hr_app_flutter/features/home/widget/education_screen.dart';
import 'package:hr_app_flutter/features/wallet/widget/grass_coin_sreen/grass_coin_screen.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/lean_productions_screen_form.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/my_lean_productions_screen.dart';
import 'package:hr_app_flutter/features/home/widget/main_app_screen.dart';
import 'package:hr_app_flutter/features/wallet/widget/grass_coin_sreen/search_friend_and_send_coins_screen.dart';
import 'package:hr_app_flutter/features/services/widget/service_screen.dart/services_screen.dart';
import 'package:hr_app_flutter/features/services/widget/shedule_bus_screen/shedule_bus_screen.dart';
import 'package:hr_app_flutter/features/statements/widget/statements_screens/statement_type_list_screen.dart';
import 'package:hr_app_flutter/features/news/widget/user_main_screen.dart';
import '../features/auth/widget/auth_screen.dart';
import '../features/auth/widget/loader_screen.dart';
import '../features/news/widget/about_news_screen.dart';
import '../features/news/widget/approve_news_screen.dart';
import '../features/services/bloc/lean_production_form_bloc/lean_production_form_bloc.dart';
import '../features/services/model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import '../features/services/widget/birth_day_info_screen/birth_day_info_screen.dart';
import '../features/services/widget/lean_production_screens/lean_production_info_proposals.dart';
import '../features/services/widget/rookies_info_screen/rookies_info_screen.dart';
import '../features/user/widget/search_user/serch_user_screen.dart';
import '../features/user/widget/user_profile/user_profile_widget.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter();

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
        AutoRoute(page: ApproveNewsRoute.page, path: '/approve_news'),
        AutoRoute(page: AboutNewsRoute.page, path: '/about_news'),
        AutoRoute(page: ProfileWidgetRoute.page, path: '/profile_user'),
        AutoRoute(page: SearchUserRoute.page, path: '/search_user'),
        AutoRoute(page: ScheduleBusRoute.page, path: '/schedule_bus'),
        AutoRoute(
            page: BookingMeetingsFirstRoute.page,
            path: '/booking_meetings_first'),
        AutoRoute(
            page: BookingMeetingSecondRoute.page,
            path: '/booking_meetings_second'),
        AutoRoute(
            page: LeanProductionFormRoute.page, path: '/lean_production_form'),
        AutoRoute(
          page: MyLeanProductionsRoute.page,
          path: '/my_lean_productions',
        ),
        AutoRoute(
            page: LeanProductionInfoProposalsRoute.page,
            path: '/info_proposals'),
        AutoRoute(page: StatementFormRoute.page, path: '/statements_form'),
        AutoRoute(page: BagReportRoute.page, path: '/bag_report'),
        AutoRoute(page: BirthDayInfoRoute.page, path: '/info_birth_day'),
        AutoRoute(page: RookiesInfoRoute.page, path: '/info_rookies'),
      ];
}
