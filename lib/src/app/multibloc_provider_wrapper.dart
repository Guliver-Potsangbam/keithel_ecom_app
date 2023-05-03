import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keithel/src/core/cubit/authflow/cubit/authflow_cubit.dart';

import '../dashboard_module/logic/cubit/get_user_cubit.dart';

class MultiBlocWrapper extends StatelessWidget {
  const MultiBlocWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => GetUserCubit(),
      ),
      BlocProvider(
        create: (context) => AuthflowCubit(),
      ),
    ], child: child);
  }
}
