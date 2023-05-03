// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:keithel/src/core/authflow_page.dart' as _i1;
import 'package:keithel/src/dashboard_module/pages/category_page.dart' as _i2;
import 'package:keithel/src/dashboard_module/pages/dashboard_page.dart' as _i3;
import 'package:keithel/src/dashboard_module/pages/home_page.dart' as _i4;
import 'package:keithel/src/dashboard_module/pages/profile_page.dart' as _i5;
import 'package:keithel/src/dashboard_module/pages/update_profile_page.dart'
    as _i6;
import 'package:keithel/src/dashboard_module/pages/wishlist_page.dart' as _i7;
import 'package:keithel/src/login_module/pages/email_signIn.dart' as _i8;
import 'package:keithel/src/login_module/pages/otp_verify_page.dart' as _i9;
import 'package:keithel/src/login_module/pages/signup_page.dart' as _i10;
import 'package:keithel/src/login_module/pages/sms_signIn.dart' as _i11;
import 'package:keithel/src/login_module/pages/verify_email_page.dart' as _i12;
import 'package:keithel/src/onboarding_module/pages/onboarding_page.dart'
    as _i13;
import 'package:keithel/src/test_page.dart' as _i14;
import 'package:keithel/src/user_module/logic/user_model.dart' as _i18;
import 'package:keithel/src/welcome_module/pages/welcome_page.dart' as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AuthFlowRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthFlowPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoryPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProfilePage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.UpdateProfilePage(),
      );
    },
    WishlistRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WishlistPage(),
      );
    },
    EmailSignInRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EmailSignInPage(),
      );
    },
    OTPVerifyRoute.name: (routeData) {
      final args = routeData.argsAs<OTPVerifyRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OTPVerifyPage(
          key: args.key,
          phoneNo: args.phoneNo,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignUpPage(),
      );
    },
    SmsSignInRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SmsSignInPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VerifyEmailPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingRouteArgs>(
          orElse: () => const OnBoardingRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.OnBoardingPage(key: args.key),
      );
    },
    TestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.TestPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthFlowPage]
class AuthFlowRoute extends _i16.PageRouteInfo<void> {
  const AuthFlowRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AuthFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthFlowRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryPage]
class CategoryRoute extends _i16.PageRouteInfo<void> {
  const CategoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i16.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i17.Key? key,
    required _i18.UserModel user,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<HomeRouteArgs> page =
      _i16.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.user,
  });

  final _i17.Key? key;

  final _i18.UserModel user;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i17.Key? key,
    required _i18.UserModel user,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<ProfileRouteArgs> page =
      _i16.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.user,
  });

  final _i17.Key? key;

  final _i18.UserModel user;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i6.UpdateProfilePage]
class UpdateProfileRoute extends _i16.PageRouteInfo<void> {
  const UpdateProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          UpdateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WishlistPage]
class WishlistRoute extends _i16.PageRouteInfo<void> {
  const WishlistRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WishlistRoute.name,
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EmailSignInPage]
class EmailSignInRoute extends _i16.PageRouteInfo<void> {
  const EmailSignInRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EmailSignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailSignInRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OTPVerifyPage]
class OTPVerifyRoute extends _i16.PageRouteInfo<OTPVerifyRouteArgs> {
  OTPVerifyRoute({
    _i17.Key? key,
    required String phoneNo,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          OTPVerifyRoute.name,
          args: OTPVerifyRouteArgs(
            key: key,
            phoneNo: phoneNo,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPVerifyRoute';

  static const _i16.PageInfo<OTPVerifyRouteArgs> page =
      _i16.PageInfo<OTPVerifyRouteArgs>(name);
}

class OTPVerifyRouteArgs {
  const OTPVerifyRouteArgs({
    this.key,
    required this.phoneNo,
  });

  final _i17.Key? key;

  final String phoneNo;

  @override
  String toString() {
    return 'OTPVerifyRouteArgs{key: $key, phoneNo: $phoneNo}';
  }
}

/// generated route for
/// [_i10.SignUpPage]
class SignUpRoute extends _i16.PageRouteInfo<void> {
  const SignUpRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SmsSignInPage]
class SmsSignInRoute extends _i16.PageRouteInfo<void> {
  const SmsSignInRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SmsSignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SmsSignInRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.VerifyEmailPage]
class VerifyEmailRoute extends _i16.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i16.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OnBoardingPage]
class OnBoardingRoute extends _i16.PageRouteInfo<OnBoardingRouteArgs> {
  OnBoardingRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          OnBoardingRoute.name,
          args: OnBoardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i16.PageInfo<OnBoardingRouteArgs> page =
      _i16.PageInfo<OnBoardingRouteArgs>(name);
}

class OnBoardingRouteArgs {
  const OnBoardingRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'OnBoardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.TestPage]
class TestRoute extends _i16.PageRouteInfo<void> {
  const TestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          TestRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WelcomePage]
class WelcomeRoute extends _i16.PageRouteInfo<void> {
  const WelcomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
