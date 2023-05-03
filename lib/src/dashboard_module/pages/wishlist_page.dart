import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist Page'),
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: const Icon(Icons.arrow_back),
          // ),
        ),
        body: const Center(
          child: Text('W I S H L I S T'),
        ));
  }
}
