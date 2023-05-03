import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category Page'),
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     // Get.offAll(() => Page1());
          //   },
          //   icon: const Icon(Icons.arrow_back),
          // ),
        ),
        body: const Center(
          child: Text('C A T E G O R I E S'),
        ));
  }
}
