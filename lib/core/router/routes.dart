import 'package:flutter/material.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_screen.dart';
import 'package:hr_app_flutter/features/home/widget/company_screen.dart';
import 'package:hr_app_flutter/features/home/widget/education_screen.dart';
import 'package:hr_app_flutter/features/home/widget/home_screen.dart';
import 'package:hr_app_flutter/features/news/widget/about_news_screen.dart';
import 'package:hr_app_flutter/features/news/widget/approve_news_screen.dart';
import 'package:hr_app_flutter/features/home/widget/user_main_screen.dart';
import 'package:hr_app_flutter/features/services/widget/bag_report_screen/bag_report_screen.dart';
import 'package:hr_app_flutter/features/services/widget/birth_day_info_screen/birth_day_info_screen.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/lean_production_info_proposals.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/lean_productions_screen_form.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/my_lean_productions_screen.dart';
import 'package:hr_app_flutter/features/services/widget/rookies_info_screen/rookies_info_screen.dart';
import 'package:hr_app_flutter/features/services/widget/service_screen.dart/services_screen.dart';
import 'package:hr_app_flutter/features/services/widget/shedule_bus_screen/shedule_bus_screen.dart';
import 'package:hr_app_flutter/features/statements/widget/statements_screens/statement_type_list_screen.dart';
import 'package:hr_app_flutter/features/user/widget/search_user/serch_user_screen.dart';
import 'package:hr_app_flutter/features/user/widget/user_profile/user_profile_widget.dart';
import 'package:hr_app_flutter/features/wallet/widget/exchange_coin_for_pass/exchange_coin_for_pass.dart';
import 'package:hr_app_flutter/features/wallet/widget/grass_coin_sreen/grass_coin_screen.dart';
import 'package:hr_app_flutter/features/wallet/widget/grass_coin_sreen/search_friend_and_send_coins_screen.dart';
import 'package:octopus/octopus.dart';

enum Routes with OctopusRoute {
  signin('auth', title: 'Auth'),
  home('home', title: 'Home'),
  userMain('user-main', title: 'User Main'),
  coin('coin', title: 'Grass Coin'),
  services('services', title: 'Services'),
  education('education', title: 'Education'),
  company('company', title: 'Company'),
  searchFriendAndSendCoins('search-friend-and-send-coins',
      title: 'Search Friend And Send Coins'),
  approveNews('approve-news', title: 'Approve News'),
  aboutNews('about-news', title: 'About News'),
  profileUser('profile-user', title: 'Profile User'),
  searchUser('search-user', title: 'Search User'),
  scheduleBus('schedule-bus', title: 'Schedule Bus'),
  leanProductionForm('lean-production-form', title: 'Lean Production Form'),
  myLeanProductions('my-lean-productions', title: 'My Lean Productions'),
  infoProposals('info-proposals', title: 'Info Proposals'),
  statementsForm('statements-form', title: 'Statements Form'),
  bagReport('bag-report', title: 'Bag Report'),
  infoBirthDay('info-birth-day', title: 'Info Birth Day'),
  rookieInfo('rookie-info', title: 'Rookie Info'),
  exchangeCoinForPass('exchange-coin-for-pass',
      title: 'Exchange Coin For Pass');

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.signin => const AuthenticationFormScreen(),
        Routes.home => const HomeScreen(),
        Routes.userMain => const UserMainScreen(),
        Routes.coin => const GrassCoinScreen(),
        Routes.services => const ServicesScreen(),
        Routes.education => const EducationScreen(),
        Routes.company => const CompanyScreen(),
        Routes.searchFriendAndSendCoins =>
          const SearchFriendAndSendCoinsScreen(),
        Routes.approveNews => const ApproveNewsScreen(),
        Routes.aboutNews => AboutNewsScreen(id: node.arguments['id']),
        Routes.profileUser => ProfileWidgetScreen(userId: node.arguments['id']),
        Routes.searchUser => const SearchUserScreen(),
        Routes.scheduleBus => const ScheduleBusScreen(),
        Routes.leanProductionForm => LeanProductionFormScreen(),
        Routes.myLeanProductions => const MyLeanProductionsScreen(),
        Routes.infoProposals => LeanProductionInfoProposalsScreen(
            number: node.arguments['number'],
            id: node.arguments['id'],
          ),
        Routes.statementsForm => const StatementFormScreen(),
        Routes.bagReport => const BagReportScreen(),
        Routes.infoBirthDay => BirthDayInfoScreen(),
        Routes.rookieInfo => RookiesInfoScreen(),
        Routes.exchangeCoinForPass => const ExchangeCoinForPass(),
      };
}
