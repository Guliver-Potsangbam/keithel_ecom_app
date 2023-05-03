import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:keithel/src/core/router/app_route.dart';
import 'package:keithel/src/utils/theme/theme.dart';
// import 'package:statusbarz/statusbarz.dart';

import '../../main.dart';
import 'multibloc_provider_wrapper.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log(' isViewed = ${isViewed.toString()}');
    return MultiBlocWrapper(
      child: MaterialApp.router(
        // navigatorObservers: [Statusbarz.instance.observer],
        title: 'keithel app',
        debugShowCheckedModeBanner: false,
        theme: GAppTheme.lightTheme,

        darkTheme: GAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        //theme: ThemeData(useMaterial3: true),

        routerConfig: _appRouter.config(),

        // home: OnBoardingPage(),
        // home: isViewed != 1
        //     ? OnBoardingPage()
        //     : isLogin != 1
        //         ? const WelcomePage()
        //         : HomePage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
