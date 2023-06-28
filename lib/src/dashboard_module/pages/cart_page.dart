import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:keithel/src/dashboard_module/widgets/cart_items_card.dart';
import 'package:keithel/src/user_module/logic/user_model.dart';
import 'package:keithel/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/colors.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.user});

  final UserModel user;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var colorList = [Colors.red, Colors.green, Colors.blue];

  final _pageController = PageController(initialPage: 0);
  final _couponPageController = PageController(initialPage: 0);

  bool isChecked = false;

  // Initial Selected Value
  String initialSize = '6';

  // List of sizes in our dropdown menu
  var sizes = [
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  // Initial Selected Value
  String initialQuantity = '1';

  // List of quantities in our dropdown menu
  var quantity =
      List<String>.generate(9, (index) => String.fromCharCode(index + 49));

  void getCheckBoxValue(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked.
      setState(() {
        isChecked = true;
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked.
      setState(() {
        isChecked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // centerTitle: true,
        title: const Text(
          'SHOPPING CART',
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

                //Notification ends here
              ],
            ),
          ),
        ],
      ),
      // drawer: SideBarPage(user: user),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: screenSize.width,
                  height: 65,
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: const TextSpan(
                                    text: 'Deliver to: ',
                                    style: TextStyle(
                                        color: gDarkColor, fontSize: 13),
                                    children: [
                                      TextSpan(
                                        text: 'Guliver Potsangbam, Imphal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Heirangoithong, Naoriya Pakhang Lakpa Leikai, Imphal ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: gElevatedButtonTheme
                                .lightElevatedButtonTheme.style!
                                .copyWith(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.zero),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.white),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide.none,
                                    ),
                                    elevation:
                                        const MaterialStatePropertyAll(0)),
                            onPressed: () {},
                            child: const Text(
                              'CHANGE',
                              style: TextStyle(
                                  color: Color(0xfff4456e),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Offer
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: screenSize.width,
                  height: 155,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/icons/offers.png',
                              height: 17,
                            ),
                            const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: RichText(
                                text: const TextSpan(
                                    text: 'Offers ',
                                    style: TextStyle(
                                        color: gDarkColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: '(3)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      //Offer Inside Container

                      SizedBox(
                        height: 95,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  // width: screenSize.width * 0.94,
                                  height: 105,
                                  decoration: BoxDecoration(
                                      // color: colorList[index],
                                      border: Border.all(color: gGreyColor),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      //Offer Inside Container Ends

                      const SizedBox(height: 10),

                      Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 5,
                            dotWidth: 5,
                            activeDotColor: gBlackColor,
                            expansionFactor: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Offer Part Ends Here

              //Items Selected

              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(1)),
                      side: const BorderSide(width: 0.8),
                      value: isChecked,
                      onChanged: (value) {
                        getCheckBoxValue(value!);
                      },
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.white),
                      activeColor: const Color(0xfff4456e),
                      checkColor: Colors.white,
                      tristate: false,
                    ),
                  ),
                  // const SizedBox(width: 5),
                  RichText(
                    text: const TextSpan(
                        text: '3/3 ITEMS SELECTED ',
                        style: TextStyle(
                            color: gDarkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        children: [
                          TextSpan(
                            text: '(₹ 2,702)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffff406c)),
                          )
                        ]),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      size: 17,
                    ),
                  ),
                ],
              ),

              // Items Cards
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: CardItemsCard(
                    initialSize: initialSize,
                    sizes: sizes,
                    initialQuantity: initialQuantity,
                    quantity: quantity),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: CardItemsCard(
                    initialSize: initialSize,
                    sizes: sizes,
                    initialQuantity: initialQuantity,
                    quantity: quantity),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: CardItemsCard(
                    initialSize: initialSize,
                    sizes: sizes,
                    initialQuantity: initialQuantity,
                    quantity: quantity),
              ),

              // Gifting and Personalisation

              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  // color: Colors.blue,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'GIFTING AND PERSONALISATION',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.5),
                    ),
                  ),
                ),
              ),

              Container(
                width: screenSize.width,
                height: 100,
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xfffff2ec),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4))),
                        child: Image.asset('assets/images/icons/gifts.png'),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xfffff2ec),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4))),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              'Buying for a loved one ?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Get wrap and personalised message on card',
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Only for ₹25',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // ENd of Gifting

              // COUPONS

              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  // color: Colors.blue,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'COUPONS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.5),
                    ),
                  ),
                ),
              ),

              Container(
                width: screenSize.width,
                height: 195,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/icons/offers.png',
                            height: 18,
                          ),
                          const SizedBox(width: 7),
                          const Text(
                            'Best Coupon For You',
                            style: TextStyle(
                                color: gDarkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              log('Chatle');
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'All Coupons',
                                  style: TextStyle(
                                      color: Color(0xfff4456e),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Color(0xfff4456e),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(height: 8),

                    //Coupon Inside Container

                    SizedBox(
                      height: 130,
                      child: PageView.builder(
                        controller: _couponPageController,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: screenSize.width * 0.94,
                                height: 130,
                                decoration: BoxDecoration(
                                    // color: colorList[index],
                                    border: Border.all(color: gGreyColor),
                                    borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'Save upto ₹150',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                        'Shop for 1 item(s) more to apply'),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          // color: Colors.red,
                                          width: 115,
                                          height: 50,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                'assets/images/icons/coupon_code_area.png',
                                              ),
                                              Center(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "FWD15",
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: 42,
                                          width: 90,
                                          child: ElevatedButton(
                                            style: gElevatedButtonTheme
                                                .lightElevatedButtonTheme.style!
                                                .copyWith(
                                                    padding:
                                                        const MaterialStatePropertyAll(
                                                            EdgeInsets.zero),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            Colors.white),
                                                    side:
                                                        const MaterialStatePropertyAll(
                                                      BorderSide(
                                                        color:
                                                            Color(0xfff4456e),
                                                      ),
                                                    ),
                                                    elevation:
                                                        const MaterialStatePropertyAll(
                                                            0)),
                                            onPressed: () {},
                                            child: const Text('+ADD ITEM',
                                                style: TextStyle(
                                                  color: Color(0xfff4456e),
                                                )),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //COUPONS Inside Container Ends

                    // const SizedBox(height: 10),

                    // Center(
                    //   child: SmoothPageIndicator(
                    //     controller: _couponPageController,
                    //     count: 3,
                    //     effect: const ExpandingDotsEffect(
                    //       dotHeight: 5,
                    //       dotWidth: 5,
                    //       activeDotColor: gBlackColor,
                    //       expansionFactor: 2,
                    //     ),
                    //   ),
                    // ),

                    // COUPONS Part Ends here
                  ],
                ),
              ),

              // ENd of COUPONS

              // PRICE DETAILS

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: screenSize.width,
                  height: 250,
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PRICE DETAILS (3 Items)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      const Divider(),
                      Row(
                        children: const [
                          Text(
                            'Total MRP',
                            style: TextStyle(fontSize: 12.5),
                          ),
                          Spacer(),
                          Text(
                            '₹ 7,354',
                            style: TextStyle(fontSize: 12.5),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            'Discount on MRP',
                            style: TextStyle(fontSize: 12.5),
                          ),
                          Spacer(),
                          Text(
                            '₹ -5,060',
                            style:
                                TextStyle(color: Colors.green, fontSize: 12.5),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Coupon Discount',
                            style: TextStyle(fontSize: 12.5),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              log('Apply Coupon da namme');
                            },
                            child: const Text(
                              'Apply Coupon',
                              style: TextStyle(
                                  color: Color(0xfff4456e), fontSize: 12.5),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Convenience Fee',
                            style: TextStyle(fontSize: 12.5),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              log('Know More da namme');
                            },
                            child: const Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xfff4456e),
                              size: 20,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '₹10',
                            style: TextStyle(fontSize: 12.5),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: const [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Spacer(),
                          Text(
                            '₹ 2,304',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ENd of PRICE DETAILS

              Container(
                height: 75,
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icons/original.png',
                          height: 40,
                        ),
                        // const SizedBox(height: 0),
                        const Text(
                          'Genuine Products',
                          style:
                              TextStyle(color: Color(0xff6c6d79), fontSize: 11),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: CircleAvatar(
                          backgroundColor: Color(0xff6c6d79), radius: 3),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icons/contactless_delivery.png',
                          height: 40,
                        ),
                        // const SizedBox(height: 0),
                        const Text(
                          'Contactless Delivery',
                          style:
                              TextStyle(color: Color(0xff6c6d79), fontSize: 11),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 7.0),
                      child: CircleAvatar(
                          backgroundColor: Color(0xff6c6d79), radius: 3),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icons/secure_payment.png',
                          height: 40,
                        ),
                        // const SizedBox(height: 2),
                        const Text(
                          'Secure Payments',
                          style:
                              TextStyle(color: Color(0xff6c6d79), fontSize: 11),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        height: 90,
        child: Column(
          children: [
            Container(
              height: 23,
              width: screenSize.width,
              color: const Color.fromARGB(255, 255, 230, 224),
              child: const Center(
                child: Text(
                  "3 Items selected for order",
                  style: TextStyle(fontSize: 12),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: screenSize.width * 0.92,
              child: ElevatedButton(
                  style: gElevatedButtonTheme.lightElevatedButtonTheme.style!
                      .copyWith(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xffff406c)),
                    side: const MaterialStatePropertyAll(BorderSide.none),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Place Order')),
            ),
          ],
        ),
      ),
    );
  }
}
