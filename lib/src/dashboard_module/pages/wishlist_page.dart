import 'package:auto_route/auto_route.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';

import 'package:badges/badges.dart' as badges;

import '../../sidebar_module/pages/sidebar.dart';
import '../../user_module/logic/user_model.dart';

import '../widgets/wishlist_items_card.dart';

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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenSize = MediaQuery.of(context).size;
    CollectionReference cartItemsCollection = firestore.collection('cart');
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

                      return WishlistItemsCard(
                          wishlist: wishlist, index: index);
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
