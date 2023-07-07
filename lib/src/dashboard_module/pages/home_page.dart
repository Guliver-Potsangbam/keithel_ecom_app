import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/core/constants/text_strings.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';
import 'package:keithel/src/dashboard_module/widgets/product_card.dart';
import 'package:keithel/src/sidebar_module/pages/sidebar.dart';
import 'package:badges/badges.dart' as badges;

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../user_module/logic/user_model.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});

  final UserModel user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List carouselImagesList = [
    {"id": 1, "image_path": "assets/images/homepage/carousel1.png"},
    {"id": 2, "image_path": "assets/images/homepage/carousel2.png"}
  ];

  final colors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
    // Colors.amberAccent,
    // Colors.blue,
    // Colors.amber,
  ];

  final _db = FirebaseFirestore.instance;

  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      Future.delayed(const Duration(seconds: 5), () {
        // Here you can write your code
        setState(() {
          // Here you can write your code for open new view
          if (_currentPage < 2) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: const Text(gAppName),
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
                        context.router.push(CartRoute(user: widget.user));
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
        drawer: SideBarPage(user: widget.user),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: screenSize.width - 2 * gDefaultSize + 20,
                      height: 38,
                      decoration: BoxDecoration(
                        color: gSoftWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          // search value
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search Product",
                          hintStyle: const TextStyle(fontSize: 13),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20.0,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.mic,
                                  size: 20.0,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 20.0,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                //Carousel Part

                SizedBox(
                  height: 172,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          color: colors[index],
                          height: 170,
                          width: 200,
                          // child: Lottie.network(
                          //     'https://assets3.lottiefiles.com/packages/lf20_5tkzkblw.json'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: gBlackColor,
                    expansionFactor: 2,
                  ),
                ),

                const SizedBox(height: 10),

                // Recently Viewed
                StreamBuilder(
                    stream: _db
                        .collection("products")
                        .where("is_recently_viewed", isEqualTo: true)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        print('Something went wrong');
                      }

                      final List recentlyViewed = [];
                      if (snapshot.hasData) {
                        snapshot.data!.docs.map(
                            (QueryDocumentSnapshot<Map<String, dynamic>> e) {
                          Map a = e.data();
                          recentlyViewed.add(a);
                        }).toList();
                      }
                      return Visibility(
                        visible: recentlyViewed.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recently Viewed',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            InkWell(
                              onTap: () {
                                context.router.push(
                                    ShowAllRoute(itemList: recentlyViewed));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Show All',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const Icon(Icons.arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                const SizedBox(height: 10),

                // Recently Viewed Images ListView
                StreamBuilder(
                  stream: _db
                      .collection("products")
                      .where("is_recently_viewed", isEqualTo: true)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      print('Something went wrong');
                    }

                    final List recentlyViewed = [];
                    if (snapshot.hasData) {
                      // snapshot.data!.docs
                      //     .map((QueryDocumentSnapshot<Map<String, dynamic>>
                      //             e) =>
                      //         log(e.data().toString()))
                      //     .toList();
                      snapshot.data!.docs
                          .map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
                        Map a = e.data();
                        // log(a.toString());
                        recentlyViewed.add(a);
                      }).toList();
                    }

                    return recentlyViewed.isNotEmpty
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 190,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: recentlyViewed.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        context.router.push(
                                          ProductRoute(
                                              brand: recentlyViewed[index]
                                                  ["brand"],
                                              discription:
                                                  'This is the descroiption part of the item. Just a sample !',
                                              imageUrl: recentlyViewed[index]
                                                  ["product_image_path"],
                                              name: recentlyViewed[index]
                                                  ["product_name"],
                                              price: recentlyViewed[index]
                                                      ["product_price"]
                                                  .toString()),
                                        );
                                      },
                                      child: ProductCard(
                                        productImagePath: recentlyViewed[index]
                                            ["product_image_path"],
                                        productName: recentlyViewed[index]
                                            ["product_name"],
                                        productPrice: recentlyViewed[index]
                                                ["product_price"]
                                            .toString(),
                                        productId: recentlyViewed[index]
                                            ["product_id"],
                                        isFavorite: recentlyViewed[index]
                                            ["is_favorite"],
                                      ));
                                },
                              ),
                            ),
                          )
                        : Container();
                  },
                ),

                const SizedBox(height: 10),

                // New Arrivals
                StreamBuilder(
                    stream: _db
                        .collection("products")
                        .where("is_new_arrival", isEqualTo: true)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        print('Something went wrong');
                      }

                      final List newArrivals = [];
                      if (snapshot.hasData) {
                        snapshot.data!.docs.map(
                            (QueryDocumentSnapshot<Map<String, dynamic>> e) {
                          Map a = e.data();
                          newArrivals.add(a);
                        }).toList();
                      }
                      return Visibility(
                        visible: newArrivals.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New Arrivals',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            InkWell(
                              onTap: () {
                                context.router
                                    .push(ShowAllRoute(itemList: newArrivals));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Show All',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const Icon(Icons.arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                const SizedBox(height: 10),

                // New Arrivals Images ListView
                StreamBuilder(
                  stream: _db
                      .collection("products")
                      .where("is_new_arrival", isEqualTo: true)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      print('Something went wrong');
                    }

                    final List newArrivals = [];
                    if (snapshot.hasData) {
                      // snapshot.data!.docs
                      //     .map((QueryDocumentSnapshot<Map<String, dynamic>>
                      //             e) =>
                      //         log(e.data().toString()))
                      //     .toList();
                      snapshot.data!.docs
                          .map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
                        Map a = e.data();

                        newArrivals.add(a);
                      }).toList();
                    }

                    return newArrivals.isNotEmpty
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 190,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: newArrivals.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        context.router.push(ProductRoute(
                                            brand: newArrivals[index]["brand"],
                                            discription:
                                                'This is the descroiption part of the item. Just a sample !',
                                            imageUrl: newArrivals[index]
                                                ["product_image_path"],
                                            name: newArrivals[index]
                                                ["product_name"],
                                            price: newArrivals[index]
                                                    ["product_price"]
                                                .toString()));
                                      },
                                      child: ProductCard(
                                        productImagePath: newArrivals[index]
                                            ["product_image_path"],
                                        productName: newArrivals[index]
                                            ["product_name"],
                                        productPrice: newArrivals[index]
                                                ["product_price"]
                                            .toString(),
                                        productId: newArrivals[index]
                                            ["product_id"],
                                        isFavorite: newArrivals[index]
                                            ["is_favorite"],
                                      ));
                                },
                              ),
                            ),
                          )
                        : Container();
                  },
                ),

                const SizedBox(height: 10),

                // Top Trends
                StreamBuilder(
                    stream: _db
                        .collection("products")
                        .where("is_top_trend", isEqualTo: true)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        print('Something went wrong');
                      }

                      final List topTrends = [];
                      if (snapshot.hasData) {
                        snapshot.data!.docs.map(
                            (QueryDocumentSnapshot<Map<String, dynamic>> e) {
                          Map a = e.data();
                          topTrends.add(a);
                        }).toList();
                      }
                      return Visibility(
                        visible: topTrends.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Trends',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            InkWell(
                              onTap: () {
                                context.router
                                    .push(ShowAllRoute(itemList: topTrends));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Show All',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const Icon(Icons.arrow_right),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                const SizedBox(height: 10),

                // Top Trends Images ListView
                StreamBuilder(
                  stream: _db
                      .collection("products")
                      .where("is_top_trend", isEqualTo: true)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      print('Something went wrong');
                    }

                    final List topTrends = [];
                    if (snapshot.hasData) {
                      // snapshot.data!.docs
                      //     .map((QueryDocumentSnapshot<Map<String, dynamic>>
                      //             e) =>
                      //         log(e.data().toString()))
                      //     .toList();
                      snapshot.data!.docs
                          .map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
                        Map a = e.data();
                        topTrends.add(a);
                      }).toList();
                    }

                    return topTrends.isNotEmpty
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 190,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: topTrends.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        context.router.push(ProductRoute(
                                            brand: topTrends[index]["brand"],
                                            discription:
                                                'This is the descroiption part of the item. Just a sample !',
                                            imageUrl: topTrends[index]
                                                ["product_image_path"],
                                            name: topTrends[index]
                                                ["product_name"],
                                            price: topTrends[index]
                                                    ["product_price"]
                                                .toString()));
                                      },
                                      child: ProductCard(
                                        productImagePath: topTrends[index]
                                            ["product_image_path"],
                                        productName: topTrends[index]
                                            ["product_name"],
                                        productPrice: topTrends[index]
                                                ["product_price"]
                                            .toString(),
                                        productId: topTrends[index]
                                            ["product_id"],
                                        isFavorite: topTrends[index]
                                            ["is_favorite"],
                                      ));
                                },
                              ),
                            ),
                          )
                        : Container();
                  },
                ),

                // Top Trends Images ListView -- End
              ],
            ),
          ),
        ),
      ),
    );
  }
}
