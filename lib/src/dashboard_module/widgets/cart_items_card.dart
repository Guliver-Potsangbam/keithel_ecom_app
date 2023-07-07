// ignore: must_be_immutable

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

// ignore: must_be_immutable
class CardItemsCard extends StatefulWidget {
  CardItemsCard({
    super.key,
    required this.availableSizes,
    required this.selectedSize,
    required this.availableQuantities,
    required this.selectedQuantity,
    required this.brand,
    required this.productName,
    required this.seller,
    required this.productPrice,
    required this.offerPercent,
    required this.isReturnable,
    required this.returnableDays,
    required this.productImagePath,
    required this.productId,
    required this.delFunc,
  });

  final String productImagePath;
  final String brand;
  final String productName;
  final String seller;

  final Function delFunc;

  final List<String> availableSizes;
  String selectedSize;

  final List<num> availableQuantities;
  num selectedQuantity;

  final num productPrice;
  final num offerPercent;
  final bool isReturnable;
  final num returnableDays;
  final String productId;

  @override
  State<CardItemsCard> createState() => _CardItemsCardState();
}

class _CardItemsCardState extends State<CardItemsCard> {
  bool _isSelected = true;

  void getCheckBoxValue(bool value) {
    if (_isSelected == false) {
      // Put your code here which you want to execute on CheckBox Checked.
      setState(() {
        _isSelected = true;
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked.
      setState(() {
        _isSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      // width: screenSize.width,
      height: 170,
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffc16d53)),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                // Product Image Area

                Container(
                  padding: const EdgeInsets.all(5),
                  color: const Color(0xfffff2ec),
                  child: Image(
                    image: CachedNetworkImageProvider(
                      widget.productImagePath,
                    ),
                    height: 150,
                  ),
                ),
                // Positioned(
                //   left: -8,
                //   top: -8,
                //   child: Container(
                //     color: Colors.white,
                //     height: 10,
                //     width: 10,
                //   ),
                // ),
                Positioned(
                  left: -7,
                  top: -7,
                  // child: Container(
                  //   height: 14,
                  //   width: 14,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white.withOpacity(0.5),
                  //     // borderRadius: BorderRadius.circular(8),
                  //   ),
                  child: Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(1)),
                      side: const BorderSide(width: 0.8),
                      value: _isSelected,
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
                ),
              ],
            ),
          ),

          // Text Area

          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.brand,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.productName),
                    Text(
                      'Sold by: ${widget.seller}',
                      style: const TextStyle(fontSize: 11, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    //Select your item size

                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                context: context,
                                builder: (context) {
                                  int tabIndex = widget.availableSizes
                                      .indexOf(widget.selectedSize);

                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return SizedBox(
                                        height: 140,
                                        width: screenSize.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 10),
                                              child: Text(
                                                'Select size',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 75,
                                              // color: Colors.green,
                                              width: screenSize.width,
                                              child: ListView.builder(
                                                itemCount: widget
                                                    .availableSizes.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 3, 15, 7),
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          widget.selectedSize =
                                                              widget.availableSizes[
                                                                  index];
                                                          tabIndex = index;
                                                          log(widget
                                                              .selectedSize
                                                              .toString());
                                                          // context.router.pop();
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            color: index ==
                                                                    tabIndex
                                                                ? Colors.black
                                                                : Colors
                                                                    .transparent,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black),
                                                            shape: BoxShape
                                                                .circle),
                                                        child: Center(
                                                            child: Text(
                                                          widget.availableSizes[
                                                              index],
                                                          style: TextStyle(
                                                            color: index ==
                                                                    tabIndex
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        )),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                // ignore: use_build_context_synchronously
                                                context.router.pop();

                                                await FirebaseFirestore.instance
                                                    .collection('cart')
                                                    .doc(widget.productId)
                                                    .update({
                                                  'selected_size':
                                                      widget.selectedSize
                                                });
                                              },
                                              child: Container(
                                                height: 37,
                                                width: screenSize.width,
                                                color: const Color(0xfff4456e),
                                                child: const Center(
                                                    child: Text(
                                                  'Done',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },

                            // Size Small Grey Container

                            child: Container(
                              padding: EdgeInsets.zero,
                              height: 25,
                              decoration: BoxDecoration(
                                color: const Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Size:  ${widget.selectedSize}'),
                                    const Icon(Icons.arrow_drop_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        //  Quantity of items

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                context: context,
                                builder: (context) {
                                  int tabIndex = widget.availableQuantities
                                      .indexOf(widget.selectedQuantity);
                                  log(tabIndex.toString());

                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return SizedBox(
                                        height: 140,
                                        width: screenSize.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 10),
                                              child: Text(
                                                'Select Quantity',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 75,
                                              // color: Colors.green,
                                              width: screenSize.width,
                                              child: ListView.builder(
                                                itemCount: widget
                                                    .availableQuantities.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 3, 15, 7),
                                                itemBuilder: (context, index) {
                                                  log(widget.availableQuantities
                                                      .length
                                                      .toString());
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          widget.selectedQuantity =
                                                              widget.availableQuantities[
                                                                  index];
                                                          tabIndex = index;
                                                          // log(widget
                                                          //     .initialSize
                                                          //     .toString());
                                                          // context.router.pop();
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            color: index ==
                                                                    tabIndex
                                                                ? Colors.black
                                                                : Colors
                                                                    .transparent,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black),
                                                            shape: BoxShape
                                                                .circle),
                                                        child: Center(
                                                            child: Text(
                                                          widget
                                                              .availableQuantities[
                                                                  index]
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: index ==
                                                                    tabIndex
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        )),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                // ignore: use_build_context_synchronously
                                                context.router.pop();

                                                await FirebaseFirestore.instance
                                                    .collection('cart')
                                                    .doc(widget.productId)
                                                    .update({
                                                  'selected_quantity':
                                                      widget.selectedQuantity
                                                });
                                              },
                                              child: Container(
                                                height: 37,
                                                width: screenSize.width,
                                                color: const Color(0xfff4456e),
                                                child: const Center(
                                                    child: Text(
                                                  'Done',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },

                            // Size Small Grey Container

                            child: Container(
                              padding: EdgeInsets.zero,
                              height: 25,
                              decoration: BoxDecoration(
                                color: const Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Qty:  ${widget.selectedQuantity}'),
                                    const Icon(Icons.arrow_drop_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: widget.offerPercent == 0 ? false : true,
                          child: Row(
                            children: [
                              Text(
                                '₹ ${(widget.selectedQuantity * (widget.productPrice - widget.productPrice * widget.offerPercent / 100)).toStringAsFixed(2)}',
                                style: const TextStyle(
                                    color: gDarkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),

                        // MRP - Original Price
                        Text(
                          '₹ ${widget.productPrice * widget.selectedQuantity}',
                          style: TextStyle(
                              decoration: widget.offerPercent == 0
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: widget.offerPercent == 0
                                  ? Colors.black
                                  : Colors.grey),
                        ),

                        const SizedBox(width: 10),

                        Visibility(
                          visible: widget.offerPercent == 0 ? false : true,
                          child: Text(
                            '${widget.offerPercent}% OFF',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xffff406c)),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: widget.isReturnable ? true : false,
                      child: RichText(
                        text: TextSpan(
                            text: '${widget.returnableDays} days',
                            style: const TextStyle(
                                color: gDarkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                            children: const [
                              TextSpan(
                                text: ' return available',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal),
                              )
                            ]),
                      ),
                    ),
                  ]),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () async {
                  log('card kak a');
                  log('${widget.productId} --- ${widget.productName}');

                  widget.delFunc();
                },
                child: const Icon(Icons.close, size: 17)),
          ),
        ],
      ),
    );
  }
}
