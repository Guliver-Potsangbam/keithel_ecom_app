import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';
import 'cubit/authflow/cubit/authflow_cubit.dart';

@RoutePage()
class AuthFlowPage extends StatelessWidget {
  const AuthFlowPage({super.key});

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
            return [const WelcomeRoute()];
        }
      },
    );
  }
}
