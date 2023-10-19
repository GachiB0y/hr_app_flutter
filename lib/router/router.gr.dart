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
          authRepository: args.authRepository,
          eventEntityRepository: args.eventEntityRepository,
        )),
      );
    },
    ApproveNewsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproveNewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ApproveNewsScreen(
          key: args.key,
          authRepository: args.authRepository,
          eventEntityRepository: args.eventEntityRepository,
        )),
      );
    },
    AuthenticationFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationFormScreen(),
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
    ProfileWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileWidgetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProfileWidgetScreen(
          key: args.key,
          userId: args.userId,
          authRepository: args.authRepository,
          userRepo: args.userRepo,
        )),
      );
    },
    ScheduleBusRoute.name: (routeData) {
      final args = routeData.argsAs<ScheduleBusRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ScheduleBusScreen(
          key: args.key,
          authRepository: args.authRepository,
          serviceRepository: args.serviceRepository,
        )),
      );
    },
    SearchFriendAndSendCoinsRoute.name: (routeData) {
      final args = routeData.argsAs<SearchFriendAndSendCoinsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SearchFriendAndSendCoinsScreen(
          key: args.key,
          authRepository: args.authRepository,
          userRepo: args.userRepo,
        )),
      );
    },
    SearchUserRoute.name: (routeData) {
      final args = routeData.argsAs<SearchUserRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SearchUserScreen(
          key: args.key,
          authRepository: args.authRepository,
          userRepo: args.userRepo,
        )),
      );
    },
    ServicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServicesScreen(),
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
    required AuthRepository authRepository,
    required EventEntityRepository eventEntityRepository,
    List<PageRouteInfo>? children,
  }) : super(
          AboutNewsRoute.name,
          args: AboutNewsRouteArgs(
            key: key,
            id: id,
            authRepository: authRepository,
            eventEntityRepository: eventEntityRepository,
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
    required this.authRepository,
    required this.eventEntityRepository,
  });

  final Key? key;

  final int id;

  final AuthRepository authRepository;

  final EventEntityRepository eventEntityRepository;

  @override
  String toString() {
    return 'AboutNewsRouteArgs{key: $key, id: $id, authRepository: $authRepository, eventEntityRepository: $eventEntityRepository}';
  }
}

/// generated route for
/// [ApproveNewsScreen]
class ApproveNewsRoute extends PageRouteInfo<ApproveNewsRouteArgs> {
  ApproveNewsRoute({
    Key? key,
    required AuthRepository authRepository,
    required EventEntityRepository eventEntityRepository,
    List<PageRouteInfo>? children,
  }) : super(
          ApproveNewsRoute.name,
          args: ApproveNewsRouteArgs(
            key: key,
            authRepository: authRepository,
            eventEntityRepository: eventEntityRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'ApproveNewsRoute';

  static const PageInfo<ApproveNewsRouteArgs> page =
      PageInfo<ApproveNewsRouteArgs>(name);
}

class ApproveNewsRouteArgs {
  const ApproveNewsRouteArgs({
    this.key,
    required this.authRepository,
    required this.eventEntityRepository,
  });

  final Key? key;

  final AuthRepository authRepository;

  final EventEntityRepository eventEntityRepository;

  @override
  String toString() {
    return 'ApproveNewsRouteArgs{key: $key, authRepository: $authRepository, eventEntityRepository: $eventEntityRepository}';
  }
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
/// [ProfileWidgetScreen]
class ProfileWidgetRoute extends PageRouteInfo<ProfileWidgetRouteArgs> {
  ProfileWidgetRoute({
    Key? key,
    required int userId,
    required AuthRepository authRepository,
    required UserRepository userRepo,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileWidgetRoute.name,
          args: ProfileWidgetRouteArgs(
            key: key,
            userId: userId,
            authRepository: authRepository,
            userRepo: userRepo,
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
    required this.authRepository,
    required this.userRepo,
  });

  final Key? key;

  final int userId;

  final AuthRepository authRepository;

  final UserRepository userRepo;

  @override
  String toString() {
    return 'ProfileWidgetRouteArgs{key: $key, userId: $userId, authRepository: $authRepository, userRepo: $userRepo}';
  }
}

/// generated route for
/// [ScheduleBusScreen]
class ScheduleBusRoute extends PageRouteInfo<ScheduleBusRouteArgs> {
  ScheduleBusRoute({
    Key? key,
    required AuthRepository authRepository,
    required ServiceRepository serviceRepository,
    List<PageRouteInfo>? children,
  }) : super(
          ScheduleBusRoute.name,
          args: ScheduleBusRouteArgs(
            key: key,
            authRepository: authRepository,
            serviceRepository: serviceRepository,
          ),
          initialChildren: children,
        );

  static const String name = 'ScheduleBusRoute';

  static const PageInfo<ScheduleBusRouteArgs> page =
      PageInfo<ScheduleBusRouteArgs>(name);
}

class ScheduleBusRouteArgs {
  const ScheduleBusRouteArgs({
    this.key,
    required this.authRepository,
    required this.serviceRepository,
  });

  final Key? key;

  final AuthRepository authRepository;

  final ServiceRepository serviceRepository;

  @override
  String toString() {
    return 'ScheduleBusRouteArgs{key: $key, authRepository: $authRepository, serviceRepository: $serviceRepository}';
  }
}

/// generated route for
/// [SearchFriendAndSendCoinsScreen]
class SearchFriendAndSendCoinsRoute
    extends PageRouteInfo<SearchFriendAndSendCoinsRouteArgs> {
  SearchFriendAndSendCoinsRoute({
    Key? key,
    required AuthRepository authRepository,
    required UserRepository userRepo,
    List<PageRouteInfo>? children,
  }) : super(
          SearchFriendAndSendCoinsRoute.name,
          args: SearchFriendAndSendCoinsRouteArgs(
            key: key,
            authRepository: authRepository,
            userRepo: userRepo,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchFriendAndSendCoinsRoute';

  static const PageInfo<SearchFriendAndSendCoinsRouteArgs> page =
      PageInfo<SearchFriendAndSendCoinsRouteArgs>(name);
}

class SearchFriendAndSendCoinsRouteArgs {
  const SearchFriendAndSendCoinsRouteArgs({
    this.key,
    required this.authRepository,
    required this.userRepo,
  });

  final Key? key;

  final AuthRepository authRepository;

  final UserRepository userRepo;

  @override
  String toString() {
    return 'SearchFriendAndSendCoinsRouteArgs{key: $key, authRepository: $authRepository, userRepo: $userRepo}';
  }
}

/// generated route for
/// [SearchUserScreen]
class SearchUserRoute extends PageRouteInfo<SearchUserRouteArgs> {
  SearchUserRoute({
    Key? key,
    required AuthRepository authRepository,
    required UserRepository userRepo,
    List<PageRouteInfo>? children,
  }) : super(
          SearchUserRoute.name,
          args: SearchUserRouteArgs(
            key: key,
            authRepository: authRepository,
            userRepo: userRepo,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchUserRoute';

  static const PageInfo<SearchUserRouteArgs> page =
      PageInfo<SearchUserRouteArgs>(name);
}

class SearchUserRouteArgs {
  const SearchUserRouteArgs({
    this.key,
    required this.authRepository,
    required this.userRepo,
  });

  final Key? key;

  final AuthRepository authRepository;

  final UserRepository userRepo;

  @override
  String toString() {
    return 'SearchUserRouteArgs{key: $key, authRepository: $authRepository, userRepo: $userRepo}';
  }
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
