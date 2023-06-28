import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';

import '../logic/cubit/get_user_cubit.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    var s = context.watch<GetUserCubit>().state;

    switch (s.status) {
      case Status.initial:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));

      case Status.loading:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      case Status.loaded:
        log(s.user!.toJson().toString());
        return AutoTabsScaffold(
          routes: [
            HomeRoute(user: s.user!),
            const CategoryRoute(),
            WishlistRoute(user: s.user!),
            ProfileRoute(user: s.user!),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 11.0,
              unselectedFontSize: 11.0,
              selectedItemColor: gDarkColor,
              unselectedItemColor: gDarkColor,
              iconSize: 19.0,
              showUnselectedLabels: true,
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Shop',
                    icon: Icon(Icons.category_outlined),
                    activeIcon: Icon(Icons.category)),
                BottomNavigationBarItem(
                    label: 'Wishlist',
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    label: 'Account',
                    icon: Icon(Icons.person_outlined),
                    activeIcon: Icon(Icons.person)),
              ],
            );
          },
        );

      case Status.error:
        return const Scaffold(body: Center(child: Text("Error")));
    }
  }
}
