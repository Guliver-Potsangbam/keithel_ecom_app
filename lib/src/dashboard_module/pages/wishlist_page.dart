import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';
import 'package:keithel/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:badges/badges.dart' as badges;

import '../../sidebar_module/pages/sidebar.dart';
import '../../user_module/logic/user_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

@RoutePage()
class WishlistPage extends StatelessWidget {
  WishlistPage({super.key, required this.user});

  final UserModel user;

  List fakeList = ['Tomba', 'Chaoba', 'Gulu'];

  final colors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amberAccent,
    Colors.blue,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'WISHLIST',
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // My Cart Action Button
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 3, end: 7),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: gBadgeColor,
                    padding: const EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(4),
                    elevation: 0,
                  ),
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.router.push(CartRoute(user: user));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 20.0,
                    ),
                  ),
                ),

                // Notification Action Button
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 3, end: 7),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: gBadgeColor,
                    padding: const EdgeInsets.all(5),
                    borderRadius: BorderRadius.circular(4),
                    elevation: 0,
                  ),
                  badgeContent: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: SideBarPage(user: user),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("products")
              .where("is_favorite", isEqualTo: true)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              print('Something went wrong');
            }

            final List wishlist = [];
            if (snapshot.hasData) {
              // snapshot.data!.docs
              //     .map((QueryDocumentSnapshot<Map<String, dynamic>>
              //             e) =>
              //         log(e.data().toString()))
              //     .toList();
              snapshot.data!.docs
                  .map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
                Map a = e.data();
                wishlist.add(a);
              }).toList();
            }

            // return GridView.builder(
            //   itemCount: wishlist.length,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount:
            //           (orientation == Orientation.portrait) ? 2 : 3),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Align(
            //       alignment: Alignment.center,
            //       child: ProductCard(
            //         productImagePath: wishlist[index]['product_image_path'],
            //         productName: wishlist[index]['product_name'],
            //         productPrice: wishlist[index]['product_price'].toString(),
            //         productId: wishlist[index]['product_id'],
            //         isFavorite: wishlist[index]['is_favorite'],
            //       ),
            //     );
            //   },
            // );

            return wishlist.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                    ),
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      // Each Container for each product

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
                                  .doc(wishlist[index]['product_id'])
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
                                      .doc(wishlist[index]['product_id'])
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          height: 110,
                          // color: colors[index],
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
                                        wishlist[index]['product_image_path'])),
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
                                    wishlist[index]['product_name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  // const SizedBox(
                                  //   height: 35,
                                  //   child: Text("Product Description"),
                                  // ),
                                  Text(
                                      "Category: ${wishlist[index]['category']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  const Spacer(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹ ${wishlist[index]['product_price'].toString()}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 95,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context.router
                                                .push(CartRoute(user: user));
                                          },
                                          style: gElevatedButtonTheme
                                              .lightElevatedButtonTheme.style!
                                              .copyWith(
                                            padding:
                                                const MaterialStatePropertyAll(
                                                    EdgeInsets.zero),
                                          ),
                                          child: const Text(
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
                    },
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // CachedNetworkImage(
                            //     imageUrl:
                            //         'https://assets2.lottiefiles.com/private_files/lf30_fulewbkv.json'),
                            // Lottie.network(
                            //     'https://assets2.lottiefiles.com/private_files/lf30_fulewbkv.json',
                            //     height: 120),
                            Image.asset(
                              'assets/images/empty/empty_wishlist.png',
                              height: 80,
                            ),
                            const SizedBox(height: 30),
                            Text('Your Wishlist is Empty',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            const SizedBox(height: 10),

                            Text(
                              'Tap heart button on items to start saving your favorites',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      color: gBlackColor.withOpacity(0.8)),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),

                            SizedBox(
                              height: 35,
                              width: 80,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.zero)),
                                  onPressed: () {},
                                  child: const Text(
                                    'Add Now',
                                  )),
                            ),
                          ]),
                    ),
                  );
          }),
    );
  }
}

void doNothing(BuildContext context) {}
