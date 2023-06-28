import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/colors.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final _imageController = PageController(initialPage: 0);

  final colors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.router.pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.5,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _imageController,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                  SmoothPageIndicator(
                    controller: _imageController,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: gBlackColor,
                    ),
                  ),
                ],
              ),

              //Description Container
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text: 'BROADSTAR ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Women Relaxed Flared High-Rise Non Iron Bootcut Trouser'),
                          ]),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text('MRP '),
                        Text('₹ 1,999 ',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'Varela')),
                        Text('₹ 799',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Varela')),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Available Colors',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          height: 65,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 45,
                  width: screenSize.width * 0.41,
                  child: ElevatedButton(
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(gWhiteColor),
                              foregroundColor:
                                  MaterialStateProperty.all(gSecondaryColor)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.favorite_outline_rounded),
                          SizedBox(width: 5),
                          Text('WISHLIST'),
                        ],
                      ))),
              const SizedBox(width: 5),
              SizedBox(
                height: 45,
                width: screenSize.width * 0.52,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_bag_outlined),
                      SizedBox(width: 5),
                      Text('ADD TO BAG'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
