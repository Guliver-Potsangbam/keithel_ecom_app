import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:keithel/src/utils/theme/widget_themes/elevated_button_theme.dart';

import '../../core/constants/colors.dart';

class WishlistItemsCard extends StatefulWidget {
  const WishlistItemsCard(
      {super.key, required this.wishlist, required this.index});

  final List wishlist;
  final int index;

  @override
  State<WishlistItemsCard> createState() => _WishlistItemsCardState();
}

class _WishlistItemsCardState extends State<WishlistItemsCard> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    CollectionReference cartItemsCollection =
        FirebaseFirestore.instance.collection('cart');
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: UniqueKey(),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        closeThreshold: 0.2,
        extentRatio: 0.2,
        motion: const BehindMotion(),
        dismissible: DismissiblePane(onDismissed: () async {
          try {
            await FirebaseFirestore.instance
                .collection('products')
                .doc(widget.wishlist[widget.index]['product_id'])
                .update({'is_favorite': false});
            // setState(() {
          } catch (e) {
            log(e.toString());
          }
        }),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            // flex: 1,

            // padding: EdgeInsets.only(left: 80),
            onPressed: (BuildContext context) async {
              try {
                await FirebaseFirestore.instance
                    .collection('products')
                    .doc(widget.wishlist[widget.index]['product_id'])
                    .update({'is_favorite': false});
                // setState(() {
              } catch (e) {
                log(e.toString());
              }
            },
            backgroundColor: Colors.red.withOpacity(0.8),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        height: 110,
        // color: Colors.green,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),

            // Product Image Area

            child: Container(
              height: 100,
              width: 100,
              color: gDarkGreyColor.withOpacity(0.5),
              child: Image(
                  image: CachedNetworkImageProvider(
                      widget.wishlist[widget.index]['product_image_path'])),
            ),
          ),

          // Words Area

          SizedBox(
            width: screenSize.width - 130,
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.wishlist[widget.index]['product_name'],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // const SizedBox(
                //   height: 35,
                //   child: Text("Product Description"),
                // ),
                Text("Category: ${widget.wishlist[widget.index]['category']}",
                    style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ ${widget.wishlist[widget.index]['product_price'].toString()}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 35,
                      width: 95,
                      child: ElevatedButton(
                        onPressed: () {
                          // log(wishlist[index]['size'][0]);
                          DocumentReference cartDocsRef = cartItemsCollection
                              .doc(widget.wishlist[widget.index]['product_id']);

                          cartDocsRef
                              .set(widget.wishlist[widget.index])
                              .then((value) => cartDocsRef.update({
                                    'selected_size': widget
                                        .wishlist[widget.index]['size'][0],
                                    'selected_quantity': num.parse(1.toString())
                                  }));

                          isAddedToCart = true;

                          // context.router
                          //     .push(CartRoute(user: user));

                          Future.delayed(const Duration(seconds: 0), () async {
                            try {
                              await FirebaseFirestore.instance
                                  .collection('products')
                                  .doc(widget.wishlist[widget.index]
                                      ['product_id'])
                                  .update({'is_favorite': false});
                              // setState(() {
                            } catch (e) {
                              log(e.toString());
                            }
                          });
                        },
                        style: gElevatedButtonTheme
                            .lightElevatedButtonTheme.style!
                            .copyWith(
                          padding:
                              const MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        child:
                            // isAddedToCart
                            //     ? const Icon(Icons.done)
                            //     :
                            const Text(
                          "ADD TO CART",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
