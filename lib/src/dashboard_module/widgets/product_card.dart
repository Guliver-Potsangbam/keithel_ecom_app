import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productImagePath,
    required this.productName,
    required this.productPrice,
  });

  final String productImagePath;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 130,
        // color: gAccentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 130,
                  height: 150,
                  child: Card(
                      color: gCardBgColor,
                      child: Image.asset(productImagePath)),
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                    iconSize: 17,
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              ' $productName',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              ' ₹ $productPrice',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
