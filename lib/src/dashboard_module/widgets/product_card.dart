import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.productImagePath,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.isFavorite,
  });

  final String productImagePath;
  final String productName;
  final String productPrice;
  final String productId;
  bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.yellow,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                // color: Colors.green,
                width: 130,
                height: 150,
                child: Card(
                  color: gCardBgColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                        image: CachedNetworkImageProvider(productImagePath)),
                  ),
                ),
              ),
              Positioned(
                top: -5,
                right: -5,
                child: IconButton(
                    onPressed: () async {
                      log(productId.toString());
                      try {
                        await FirebaseFirestore.instance
                            .collection('products')
                            .doc(productId.toString())
                            .update({'is_favorite': !isFavorite});
                        // setState(() {
                      } catch (e) {
                        log(e.toString());
                      }
                      //   // widget.isFavorite = !widget.isFavorite;
                      //   // FirebaseFirestore.instance
                      //   //     .collection('products')
                      //   //     .doc(widget.productId)
                      //   //     .update({'is_favorite': !widget.isFavorite});
                      // });
                    },
                    icon: isFavorite == false
                        ? const Icon(
                            Icons.favorite_border,
                            size: 18,
                          )
                        : Icon(
                            Icons.favorite,
                            color: const Color.fromRGBO(244, 67, 54, 1)
                                .withOpacity(1),
                            size: 18,
                          )),
              )
            ],
          ),
          Text(' $productName'),
          Text(
            ' ₹ $productPrice',
          )
        ],
      ),
    );
  }
}
