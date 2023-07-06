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
    required this.initialSize,
    required this.sizes,
    required this.initialQuantity,
    required this.quantity,
    required this.brand,
    required this.productName,
    required this.seller,
    required this.productPrice,
    required this.offerPercent,
    required this.isReturnable,
    required this.returnableDays,
    required this.productImagePath,
    required this.productId,
  });
  final String productImagePath;
  final String brand;
  final String productName;
  final String seller;
  late String initialSize;
  final List<String> sizes;
  late String initialQuantity;
  final List<String> quantity;
  final int productPrice;
  final int offerPercent;
  final bool isReturnable;
  final int returnableDays;
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

  int tabIndex = 0;

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
                Positioned(
                  left: -8,
                  top: -8,
                  child: Container(
                    color: Colors.white,
                    height: 10,
                    width: 10,
                  ),
                ),
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
                                                itemCount: widget.sizes.length,
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
                                                          widget.initialSize =
                                                              widget
                                                                  .sizes[index];
                                                          tabIndex = index;
                                                          log(widget.initialSize
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
                                                          widget.sizes[index],
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
                                                await FirebaseFirestore.instance
                                                    .collection('cart')
                                                    .doc(widget.productId)
                                                    .update({
                                                  'selected_size':
                                                      widget.initialSize
                                                }).then((value) =>
                                                        context.router.pop());
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
                                    Text('Size:  ${widget.initialSize}'),
                                    const Icon(Icons.arrow_drop_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),

                        //Quantity of items

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 150,
                                    width: screenSize.width,
                                    child: ListView.builder(
                                      itemCount: widget.quantity.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 10, 10),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                shape: BoxShape.circle),
                                            child: Center(
                                                child: Text(
                                                    widget.quantity[index])),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
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
                                  children: const [
                                    Text('Qty:  1'),
                                    Icon(Icons.arrow_drop_down_outlined)
                                    // DropdownButton(
                                    //   iconSize: 20,

                                    //   alignment: Alignment.centerRight,
                                    //   underline:
                                    //       Container(color: Colors.transparent),
                                    //   menuMaxHeight: 300,

                                    //   value: widget.initialQuantity,

                                    //   style: const TextStyle(
                                    //       fontSize: 14, color: Colors.black),

                                    //   // Down Arrow Icon
                                    //   icon: const Icon(Icons.keyboard_arrow_down),

                                    //   // Array list of items
                                    //   items:
                                    //       widget.quantity.map((String quantity) {
                                    //     return DropdownMenuItem(
                                    //       value: quantity,
                                    //       child: Text(quantity),
                                    //     );
                                    //   }).toList(),
                                    //   // After selecting the desired option,it will
                                    //   // change button value to selected value
                                    //   onChanged: (String? newValue) {
                                    //     setState(() {
                                    //       widget.initialQuantity = newValue!;
                                    //     });
                                    //   },
                                    // )
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
                                '₹ ${(double.parse(widget.initialQuantity) * (widget.productPrice - widget.productPrice * widget.offerPercent / 100)).toStringAsFixed(2)}',
                                style: const TextStyle(
                                    color: gDarkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                        Text(
                          '₹ ${widget.productPrice * int.parse(widget.initialQuantity)}',
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
                  log(widget.productId);
                  await FirebaseFirestore.instance
                      .collection("cart")
                      .doc(widget.productId)
                      .delete();
                },
                child: const Icon(Icons.close, size: 17)),
          ),
        ],
      ),
    );
  }
}
