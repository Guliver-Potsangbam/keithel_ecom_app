import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/constants/image_strings.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/core/constants/text_strings.dart';
import 'package:keithel/src/dashboard_module/widgets/product_card.dart';
import 'package:keithel/src/sidebar_module/pages/sidebar.dart';
import 'package:badges/badges.dart' as badges;

import 'package:lottie/lottie.dart';
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
                      onPressed: () {},
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
            padding: const EdgeInsets.fromLTRB(
                gDefaultSize - 10, 0, gDefaultSize - 10, gDefaultSize - 10),
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
                            horizontal: 6,
                            vertical: 3,
                          ),
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.mic,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.camera_alt,
                                  size: 20.0,
                                ),
                              ],
                            ),
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
                          child: Lottie.network(
                              'https://assets3.lottiefiles.com/packages/lf20_5tkzkblw.json'),
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
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: gBlackColor,
                    expansionFactor: 2,
                  ),
                ),

                const SizedBox(height: 10),

                // Recently Viewed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Viewed',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const TestPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Show All',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(Icons.arrow_right),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // Recently Viewed Images ListView
                SizedBox(
                  height: 190,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Denim Jacket',
                          productPrice: '2999.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Hoodie',
                          productPrice: '699.00',
                        ),
                        // ProductCard(
                        //   productImagePath: logoPath,
                        //   productName: 'Formal Pant',
                        //   productPrice: '1099.00',
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // New Arrivals
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrivals',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const TestPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Show All',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(Icons.arrow_right),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // New Arrivals Images ListView
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 190,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Denim Jacket',
                          productPrice: '2999.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Hoodie',
                          productPrice: '699.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Formal Pant',
                          productPrice: '1099.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Hoodie',
                          productPrice: '699.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Formal Pant',
                          productPrice: '1099.00',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Top Trends
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Trends',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const TestPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Show All',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Icon(Icons.arrow_right),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // Top Trends Images ListView
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 190,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Denim Jacket',
                          productPrice: '2999.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Hoodie',
                          productPrice: '699.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Formal Pant',
                          productPrice: '1099.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Denim Jacket',
                          productPrice: '2999.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Hoodie',
                          productPrice: '699.00',
                        ),
                        ProductCard(
                          productImagePath: logoPath,
                          productName: 'Formal Pant',
                          productPrice: '1099.00',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
