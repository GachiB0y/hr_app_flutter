// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutNewsRoute.name: (routeData) {
      final args = routeData.argsAs<AboutNewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AboutNewsScreen(
          key: args.key,
          id: args.id,
        )),
      );
    },
    ApproveNewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ApproveNewsScreen()),
      );
    },
    AuthenticationFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationFormScreen(),
      );
    },
    BagReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const BagReportScreen()),
      );
    },
    BirthDayInfoRoute.name: (routeData) {
      final args = routeData.argsAs<BirthDayInfoRouteArgs>(
          orElse: () => const BirthDayInfoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: BirthDayInfoScreen(key: args.key)),
      );
    },
    BookingMeetingSecondRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingMeetingSecondScreen(),
      );
    },
    BookingMeetingsFirstRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingMeetingsFirstScreen(),
      );
    },
    CompanyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyScreen(),
      );
    },
    EducationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EducationScreen(),
      );
    },
    GrassCoinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GrassCoinScreen(),
      );
    },
    LeanProductionFormRoute.name: (routeData) {
      final args = routeData.argsAs<LeanProductionFormRouteArgs>(
          orElse: () => const LeanProductionFormRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: LeanProductionFormScreen(key: args.key)),
      );
    },
    LeanProductionInfoProposalsRoute.name: (routeData) {
      final args = routeData.argsAs<LeanProductionInfoProposalsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: LeanProductionInfoProposalsScreen(
          key: args.key,
          modelLeanProduction: args.modelLeanProduction,
          blocLeanProduction: args.blocLeanProduction,
        )),
      );
    },
    LoaderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoaderScreen(),
      );
    },
    MainAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainAppScreen(),
      );
    },
    MyLeanProductionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MyLeanProductionsScreen()),
      );
    },
    ProfileWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileWidgetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProfileWidgetScreen(
          key: args.key,
          userId: args.userId,
        )),
      );
    },
    RookiesInfoRoute.name: (routeData) {
      final args = routeData.argsAs<RookiesInfoRouteArgs>(
          orElse: () => const RookiesInfoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: RookiesInfoScreen(key: args.key)),
      );
    },
    ScheduleBusRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ScheduleBusScreen()),
      );
    },
    SearchFriendAndSendCoinsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SearchFriendAndSendCoinsScreen()),
      );
    },
    SearchUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SearchUserScreen()),
      );
    },
    ServicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServicesScreen(),
      );
    },
    StatementFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const StatementFormScreen()),
      );
    },
    UserMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserMainScreen(),
      );
    },
  };
}

/// generated route for
/// [AboutNewsScreen]
class AboutNewsRoute extends PageRouteInfo<AboutNewsRouteArgs> {
  AboutNewsRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          AboutNewsRoute.name,
          args: AboutNewsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'AboutNewsRoute';

  static const PageInfo<AboutNewsRouteArgs> page =
      PageInfo<AboutNewsRouteArgs>(name);
}

class AboutNewsRouteArgs {
  const AboutNewsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'AboutNewsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ApproveNewsScreen]
class ApproveNewsRoute extends PageRouteInfo<void> {
  const ApproveNewsRoute({List<PageRouteInfo>? children})
      : super(
          ApproveNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApproveNewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthenticationFormScreen]
class AuthenticationFormRoute extends PageRouteInfo<void> {
  const AuthenticationFormRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BagReportScreen]
class BagReportRoute extends PageRouteInfo<void> {
  const BagReportRoute({List<PageRouteInfo>? children})
      : super(
          BagReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'BagReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BirthDayInfoScreen]
class BirthDayInfoRoute extends PageRouteInfo<BirthDayInfoRouteArgs> {
  BirthDayInfoRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BirthDayInfoRoute.name,
          args: BirthDayInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BirthDayInfoRoute';

  static const PageInfo<BirthDayInfoRouteArgs> page =
      PageInfo<BirthDayInfoRouteArgs>(name);
}

class BirthDayInfoRouteArgs {
  const BirthDayInfoRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'BirthDayInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [BookingMeetingSecondScreen]
class BookingMeetingSecondRoute extends PageRouteInfo<void> {
  const BookingMeetingSecondRoute({List<PageRouteInfo>? children})
      : super(
          BookingMeetingSecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingMeetingSecondRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingMeetingsFirstScreen]
class BookingMeetingsFirstRoute extends PageRouteInfo<void> {
  const BookingMeetingsFirstRoute({List<PageRouteInfo>? children})
      : super(
          BookingMeetingsFirstRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingMeetingsFirstRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyScreen]
class CompanyRoute extends PageRouteInfo<void> {
  const CompanyRoute({List<PageRouteInfo>? children})
      : super(
          CompanyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EducationScreen]
class EducationRoute extends PageRouteInfo<void> {
  const EducationRoute({List<PageRouteInfo>? children})
      : super(
          EducationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EducationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GrassCoinScreen]
class GrassCoinRoute extends PageRouteInfo<void> {
  const GrassCoinRoute({List<PageRouteInfo>? children})
      : super(
          GrassCoinRoute.name,
          initialChildren: children,
        );

  static const String name = 'GrassCoinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LeanProductionFormScreen]
class LeanProductionFormRoute
    extends PageRouteInfo<LeanProductionFormRouteArgs> {
  LeanProductionFormRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LeanProductionFormRoute.name,
          args: LeanProductionFormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LeanProductionFormRoute';

  static const PageInfo<LeanProductionFormRouteArgs> page =
      PageInfo<LeanProductionFormRouteArgs>(name);
}

class LeanProductionFormRouteArgs {
  const LeanProductionFormRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LeanProductionFormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LeanProductionInfoProposalsScreen]
class LeanProductionInfoProposalsRoute
    extends PageRouteInfo<LeanProductionInfoProposalsRouteArgs> {
  LeanProductionInfoProposalsRoute({
    Key? key,
    required MyLeanProductionsEntity modelLeanProduction,
    required LeanProductionFormBloc blocLeanProduction,
    List<PageRouteInfo>? children,
  }) : super(
          LeanProductionInfoProposalsRoute.name,
          args: LeanProductionInfoProposalsRouteArgs(
            key: key,
            modelLeanProduction: modelLeanProduction,
            blocLeanProduction: blocLeanProduction,
          ),
          initialChildren: children,
        );

  static const String name = 'LeanProductionInfoProposalsRoute';

  static const PageInfo<LeanProductionInfoProposalsRouteArgs> page =
      PageInfo<LeanProductionInfoProposalsRouteArgs>(name);
}

class LeanProductionInfoProposalsRouteArgs {
  const LeanProductionInfoProposalsRouteArgs({
    this.key,
    required this.modelLeanProduction,
    required this.blocLeanProduction,
  });

  final Key? key;

  final MyLeanProductionsEntity modelLeanProduction;

  final LeanProductionFormBloc blocLeanProduction;

  @override
  String toString() {
    return 'LeanProductionInfoProposalsRouteArgs{key: $key, modelLeanProduction: $modelLeanProduction, blocLeanProduction: $blocLeanProduction}';
  }
}

/// generated route for
/// [LoaderScreen]
class LoaderRoute extends PageRouteInfo<void> {
  const LoaderRoute({List<PageRouteInfo>? children})
      : super(
          LoaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoaderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainAppScreen]
class MainAppRoute extends PageRouteInfo<void> {
  const MainAppRoute({List<PageRouteInfo>? children})
      : super(
          MainAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyLeanProductionsScreen]
class MyLeanProductionsRoute extends PageRouteInfo<void> {
  const MyLeanProductionsRoute({List<PageRouteInfo>? children})
      : super(
          MyLeanProductionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyLeanProductionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileWidgetScreen]
class ProfileWidgetRoute extends PageRouteInfo<ProfileWidgetRouteArgs> {
  ProfileWidgetRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileWidgetRoute.name,
          args: ProfileWidgetRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileWidgetRoute';

  static const PageInfo<ProfileWidgetRouteArgs> page =
      PageInfo<ProfileWidgetRouteArgs>(name);
}

class ProfileWidgetRouteArgs {
  const ProfileWidgetRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'ProfileWidgetRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [RookiesInfoScreen]
class RookiesInfoRoute extends PageRouteInfo<RookiesInfoRouteArgs> {
  RookiesInfoRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RookiesInfoRoute.name,
          args: RookiesInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RookiesInfoRoute';

  static const PageInfo<RookiesInfoRouteArgs> page =
      PageInfo<RookiesInfoRouteArgs>(name);
}

class RookiesInfoRouteArgs {
  const RookiesInfoRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RookiesInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ScheduleBusScreen]
class ScheduleBusRoute extends PageRouteInfo<void> {
  const ScheduleBusRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleBusRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleBusRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchFriendAndSendCoinsScreen]
class SearchFriendAndSendCoinsRoute extends PageRouteInfo<void> {
  const SearchFriendAndSendCoinsRoute({List<PageRouteInfo>? children})
      : super(
          SearchFriendAndSendCoinsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchFriendAndSendCoinsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchUserScreen]
class SearchUserRoute extends PageRouteInfo<void> {
  const SearchUserRoute({List<PageRouteInfo>? children})
      : super(
          SearchUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServicesScreen]
class ServicesRoute extends PageRouteInfo<void> {
  const ServicesRoute({List<PageRouteInfo>? children})
      : super(
          ServicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServicesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatementFormScreen]
class StatementFormRoute extends PageRouteInfo<void> {
  const StatementFormRoute({List<PageRouteInfo>? children})
      : super(
          StatementFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatementFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserMainScreen]
class UserMainRoute extends PageRouteInfo<void> {
  const UserMainRoute({List<PageRouteInfo>? children})
      : super(
          UserMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
