// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/cupertino.dart' as _i22;
import 'package:flutter/material.dart' as _i20;
import 'package:keithel/src/core/authflow_page.dart' as _i1;
import 'package:keithel/src/dashboard_module/pages/cart_page.dart' as _i18;
import 'package:keithel/src/dashboard_module/pages/category_page.dart' as _i2;
import 'package:keithel/src/dashboard_module/pages/dashboard_page.dart' as _i3;
import 'package:keithel/src/dashboard_module/pages/home_page.dart' as _i4;
import 'package:keithel/src/dashboard_module/pages/product_page.dart' as _i5;
import 'package:keithel/src/dashboard_module/pages/profile_page.dart' as _i6;
import 'package:keithel/src/dashboard_module/pages/show_all_page.dart' as _i17;
import 'package:keithel/src/dashboard_module/pages/update_profile_page.dart'
    as _i7;
import 'package:keithel/src/dashboard_module/pages/wishlist_page.dart' as _i8;
import 'package:keithel/src/demo_page.dart' as _i9;
import 'package:keithel/src/login_module/pages/email_signIn.dart' as _i10;
import 'package:keithel/src/login_module/pages/otp_verify_page.dart' as _i11;
import 'package:keithel/src/login_module/pages/signup_page.dart' as _i12;
import 'package:keithel/src/login_module/pages/sms_signIn.dart' as _i13;
import 'package:keithel/src/login_module/pages/verify_email_page.dart' as _i14;
import 'package:keithel/src/onboarding_module/pages/onboarding_page.dart'
    as _i15;
import 'package:keithel/src/user_module/logic/user_model.dart' as _i21;
import 'package:keithel/src/welcome_module/pages/welcome_page.dart' as _i16;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AuthFlowRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthFlowPage(),
      );
    },
    CategoryRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CategoryPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ProductPage(
          key: args.key,
          name: args.name,
          brand: args.brand,
          discription: args.discription,
          price: args.price,
          imageUrl: args.imageUrl,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ProfilePage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    UpdateProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.UpdateProfilePage(),
      );
    },
    WishlistRoute.name: (routeData) {
      final args = routeData.argsAs<WishlistRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WishlistPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    DemoRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.DemoPage(),
      );
    },
    EmailSignInRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.EmailSignInPage(),
      );
    },
    OTPVerifyRoute.name: (routeData) {
      final args = routeData.argsAs<OTPVerifyRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.OTPVerifyPage(
          key: args.key,
          phoneNo: args.phoneNo,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignUpPage(),
      );
    },
    SmsSignInRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SmsSignInPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.VerifyEmailPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingRouteArgs>(
          orElse: () => const OnBoardingRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.OnBoardingPage(key: args.key),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.WelcomePage(),
      );
    },
    ShowAllRoute.name: (routeData) {
      final args = routeData.argsAs<ShowAllRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.ShowAllPage(
          key: args.key,
          itemList: args.itemList,
        ),
      );
    },
    CartRoute.name: (routeData) {
      final args = routeData.argsAs<CartRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.CartPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthFlowPage]
class AuthFlowRoute extends _i19.PageRouteInfo<void> {
  const AuthFlowRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AuthFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthFlowRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryPage]
class CategoryRoute extends _i19.PageRouteInfo<void> {
  const CategoryRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i19.PageRouteInfo<void> {
  const DashboardRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i20.Key? key,
    required _i21.UserModel user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<HomeRouteArgs> page =
      _i19.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i5.ProductPage]
class ProductRoute extends _i19.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i22.Key? key,
    required String name,
    required String brand,
    required String discription,
    required String price,
    required String imageUrl,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            name: name,
            brand: brand,
            discription: discription,
            price: price,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i19.PageInfo<ProductRouteArgs> page =
      _i19.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.name,
    required this.brand,
    required this.discription,
    required this.price,
    required this.imageUrl,
  });

  final _i22.Key? key;

  final String name;

  final String brand;

  final String discription;

  final String price;

  final String imageUrl;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, name: $name, brand: $brand, discription: $discription, price: $price, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i20.Key? key,
    required _i21.UserModel user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<ProfileRouteArgs> page =
      _i19.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i7.UpdateProfilePage]
class UpdateProfileRoute extends _i19.PageRouteInfo<void> {
  const UpdateProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UpdateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.WishlistPage]
class WishlistRoute extends _i19.PageRouteInfo<WishlistRouteArgs> {
  WishlistRoute({
    _i20.Key? key,
    required _i21.UserModel user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          WishlistRoute.name,
          args: WishlistRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'WishlistRoute';

  static const _i19.PageInfo<WishlistRouteArgs> page =
      _i19.PageInfo<WishlistRouteArgs>(name);
}

class WishlistRouteArgs {
  const WishlistRouteArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'WishlistRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i9.DemoPage]
class DemoRoute extends _i19.PageRouteInfo<void> {
  const DemoRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DemoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DemoRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.EmailSignInPage]
class EmailSignInRoute extends _i19.PageRouteInfo<void> {
  const EmailSignInRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EmailSignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailSignInRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OTPVerifyPage]
class OTPVerifyRoute extends _i19.PageRouteInfo<OTPVerifyRouteArgs> {
  OTPVerifyRoute({
    _i20.Key? key,
    required String phoneNo,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          OTPVerifyRoute.name,
          args: OTPVerifyRouteArgs(
            key: key,
            phoneNo: phoneNo,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPVerifyRoute';

  static const _i19.PageInfo<OTPVerifyRouteArgs> page =
      _i19.PageInfo<OTPVerifyRouteArgs>(name);
}

class OTPVerifyRouteArgs {
  const OTPVerifyRouteArgs({
    this.key,
    required this.phoneNo,
  });

  final _i20.Key? key;

  final String phoneNo;

  @override
  String toString() {
    return 'OTPVerifyRouteArgs{key: $key, phoneNo: $phoneNo}';
  }
}

/// generated route for
/// [_i12.SignUpPage]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SmsSignInPage]
class SmsSignInRoute extends _i19.PageRouteInfo<void> {
  const SmsSignInRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SmsSignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SmsSignInRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.VerifyEmailPage]
class VerifyEmailRoute extends _i19.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i19.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OnBoardingPage]
class OnBoardingRoute extends _i19.PageRouteInfo<OnBoardingRouteArgs> {
  OnBoardingRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          OnBoardingRoute.name,
          args: OnBoardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i19.PageInfo<OnBoardingRouteArgs> page =
      _i19.PageInfo<OnBoardingRouteArgs>(name);
}

class OnBoardingRouteArgs {
  const OnBoardingRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'OnBoardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.WelcomePage]
class WelcomeRoute extends _i19.PageRouteInfo<void> {
  const WelcomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ShowAllPage]
class ShowAllRoute extends _i19.PageRouteInfo<ShowAllRouteArgs> {
  ShowAllRoute({
    _i20.Key? key,
    required List<dynamic> itemList,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ShowAllRoute.name,
          args: ShowAllRouteArgs(
            key: key,
            itemList: itemList,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowAllRoute';

  static const _i19.PageInfo<ShowAllRouteArgs> page =
      _i19.PageInfo<ShowAllRouteArgs>(name);
}

class ShowAllRouteArgs {
  const ShowAllRouteArgs({
    this.key,
    required this.itemList,
  });

  final _i20.Key? key;

  final List<dynamic> itemList;

  @override
  String toString() {
    return 'ShowAllRouteArgs{key: $key, itemList: $itemList}';
  }
}

/// generated route for
/// [_i18.CartPage]
class CartRoute extends _i19.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i20.Key? key,
    required _i21.UserModel user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i19.PageInfo<CartRouteArgs> page =
      _i19.PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, user: $user}';
  }
}
