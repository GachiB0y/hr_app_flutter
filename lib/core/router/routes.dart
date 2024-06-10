import 'package:flutter/material.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_screen.dart';
import 'package:hr_app_flutter/features/home/widget/company_screen.dart';
import 'package:hr_app_flutter/features/home/widget/education_screen.dart';
import 'package:hr_app_flutter/features/home/widget/home_scope.dart';
import 'package:hr_app_flutter/features/home/widget/home_screen.dart';
import 'package:hr_app_flutter/features/news/widget/about_news_screen.dart';
import 'package:hr_app_flutter/features/news/widget/all_news_screen.dart';
import 'package:hr_app_flutter/features/news/widget/approve_news_screen.dart';
import 'package:hr_app_flutter/features/home/widget/user_main_screen.dart';
import 'package:hr_app_flutter/features/services/widget/bag_report_screen/bag_report_screen.dart';
import 'package:hr_app_flutter/features/services/widget/birth_day_info_screen/birth_day_info_screen.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_news_screen.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/create_lean_production_screen.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/lean_production_info_proposals.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/my_lean_productions_screen.dart';
import 'package:hr_app_flutter/features/services/widget/rookies_info_screen/rookies_info_screen.dart';
import 'package:hr_app_flutter/features/home/widget/services_screen.dart';
import 'package:hr_app_flutter/features/schedule_bus/widget/schedule_bus_screen.dart';
import 'package:hr_app_flutter/features/statements/widget/statements_screens/statement_type_list_screen.dart';
import 'package:hr_app_flutter/features/user/widget/search_user/serch_user_screen.dart';
import 'package:hr_app_flutter/features/user/widget/user_profile/user_profile_widget.dart';
import 'package:hr_app_flutter/features/wallet/widget/exchange_coin_for_pass_screen/exchange_coin_for_pass.dart';
import 'package:hr_app_flutter/features/home/widget/grass_coin_screen.dart';
import 'package:hr_app_flutter/features/wallet/widget/search_friend_and_send_coin/search_friend_and_send_coins_screen.dart';
import 'package:hr_app_flutter/features/wallet/widget/what_to_spend_screen/what_to_spend_screen.dart';
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
  myLeanProductions('my-lean-productions', title: 'My Lean Productions'),
  infoProposals('info-proposals', title: 'Info Proposals'),
  statementsForm('statements-form', title: 'Statements Form'),
  bagReport('bag-report', title: 'Bag Report'),
  infoBirthDay('info-birth-day', title: 'Info Birth Day'),
  rookieInfo('rookie-info', title: 'Rookie Info'),
  exchangeCoinForPass('exchange-coin-for-pass',
      title: 'Exchange Coin For Pass'),
  whatToSpendScreen('what-to-spend', title: 'What To Spend'),

  ///  Start Create News Screens
  createNews('create-news', title: 'Create News'),
  createNewsType('create-news-type', title: 'Create News Type'),
  createNewsDate('create-news-date', title: 'Create News Date'),
  createNewsTime('create-news-time', title: 'Create News Time'),
  createNewsTitle('create-news-title', title: 'Create News Title'),
  createNewsDescrition('create-news-descrition',
      title: 'Create News Descrition'),
  createNewsPhoto('create-news-photo', title: 'Create News Photo'),
  exampleNews('example-news', title: 'Example News'),

  /// End Create News Screens
  allNews('all-news', title: 'All News'),

  ///  Start Create Lean Production Screens

  createLeanProductionScreen('create-lean-production',
      title: 'Create Lean Production'),
  writeProblemLeanProductionScreen('write-problem-lean-production',
      title: 'Write Problem Lean Production'),

  writeSolutionLeanProductionScreen('write-solution-lean-production',
      title: 'Write Solution Lean Production'),

  writeExpensesLeanProductionScreen('write-expenses-lean-production',
      title: 'Write Expenses Lean Production'),

  writeBenefitLeanProductionScreen('write-benefit-lean-production',
      title: 'Write Benefit Lean Production'),

  selectorExecutorLeanProductionScreen('selector-executor-lean-production',
      title: 'Write Executor Lean Production'),
  pickFileLeanProduction('pick-file-lean-production',
      title: 'Pick File Lean Production');

  ///  End Create Lean Production Screens

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.signin => const AuthenticationFormScreen(),
        Routes.home => const HomeScope(child: HomeScreen()),
        Routes.userMain => const UserMainScreen(),
        Routes.coin => const GrassCoinScreen(),
        Routes.services => const ServicesScreen(),
        Routes.education => const EducationScreen(),
        Routes.company => const CompanyScreen(),
        Routes.searchFriendAndSendCoins =>
          const SearchFriendAndSendCoinsScreen(),
        Routes.approveNews => const ApproveNewsScreen(),
        Routes.aboutNews => AboutNewsScreen(id: node.arguments['id']),
        Routes.profileUser => UserProfileWidgetScreen(
            userId: node.arguments['id'],
            isSelfUser: node.arguments['isSelfUser'],
          ),
        Routes.searchUser => const SearchUserScreen(),
        Routes.scheduleBus => const ScheduleBusScreen(),
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
        Routes.whatToSpendScreen => const WhatToSpendScreen(),
        Routes.createNewsType => const SelectedTypeNewsScreen(),
        Routes.createNews => const CreateNewsScreen(),
        Routes.createNewsDate => const SelectedNewsDateScreen(),
        Routes.createNewsTime => const SelectedNewsTimeScreen(),
        Routes.createNewsTitle => const WriteTitleNewsScreen(),
        Routes.createNewsDescrition => const WriteDescriptionNewsScreen(),
        Routes.createNewsPhoto => const AddPhotoNewsScreen(),
        Routes.exampleNews => const ExmapleNewsScreen(),
        Routes.allNews => const AllNewsScreen(),
        Routes.createLeanProductionScreen => const CreateLeanProductionScreen(),
        Routes.writeProblemLeanProductionScreen =>
          const WriteProblemLeanProductionScreen(),
        Routes.writeSolutionLeanProductionScreen =>
          const WriteSolutionLeamProductionScreen(),
        Routes.writeExpensesLeanProductionScreen =>
          const WriteExpensesLeanProductionScreen(),
        Routes.writeBenefitLeanProductionScreen =>
          const WriteBenefitLeanProductionScreen(),
        Routes.selectorExecutorLeanProductionScreen =>
          const SelectExecutorLeanProductionScreen(),
        Routes.pickFileLeanProduction => const PickFileLeanProduction(),
      };
}
