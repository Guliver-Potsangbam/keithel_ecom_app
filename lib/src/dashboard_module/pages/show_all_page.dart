import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/dashboard_module/widgets/product_card.dart';

import '../../core/router/app_route.gr.dart';

@RoutePage()
class ShowAllPage extends StatelessWidget {
  const ShowAllPage({super.key, required this.itemList});

  final List itemList;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show All Page'),
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: itemList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          childAspectRatio: (orientation == Orientation.portrait) ? 2 / 3 : 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.router.push(ProductRoute()),
            child: Center(
              child: ProductCard(
                  productImagePath: itemList[index]['product_image_path'],
                  productName: itemList[index]['product_name'],
                  productPrice: itemList[index]['product_price'].toString(),
                  productId: itemList[index]['product_id'],
                  isFavorite: itemList[index]['is_favorite']),
            ),
          );
        },
      ),
    );
  }
}
