import 'package:auto_route/auto_route.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(path: '/', page: OnBoardingRoute.page),

        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: EmailSignInRoute.page),
        AutoRoute(page: SmsSignInRoute.page),
        AutoRoute(page: VerifyEmailRoute.page),
        AutoRoute(page: OTPVerifyRoute.page),

        AutoRoute(path: '/', page: AuthFlowRoute.page, children: [
          AutoRoute(page: WelcomeRoute.page),
          AutoRoute(page: DashboardRoute.page, children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: CategoryRoute.page),
            AutoRoute(page: WishlistRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ]),
        ]),
        AutoRoute(page: UpdateProfileRoute.page),
      ];
}
