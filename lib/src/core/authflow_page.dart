import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/authflow/cubit/authflow_cubit.dart';

@RoutePage()
class AuthFlowPage extends StatefulWidget {
  const AuthFlowPage({super.key});

  @override
  State<AuthFlowPage> createState() => _AuthFlowPageState();
}

class _AuthFlowPageState extends State<AuthFlowPage> {
  int isOnboardViewed = 0;

  _getOnBoardInfo() async {
    print('Shared pref called');
    // int isViewed = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isOnboardViewed = prefs.getInt('onBoard')!;
    print(prefs.getInt('onBoard'));
  }

  @override
  void initState() {
    _getOnBoardInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AuthflowCubit>().state;

    return AutoRouter.declarative(
      routes: (handler) {
        switch (state.status) {
          case Status.initial:
            return [];
          case Status.login:
            return [const DashboardRoute()];
          case Status.logout:
            return isOnboardViewed == 1
                ? [const WelcomeRoute()]
                : [OnBoardingRoute()];
        }
      },
    );
  }
}
