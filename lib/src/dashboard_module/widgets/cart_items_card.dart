// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/image_strings.dart';

// ignore: must_be_immutable
class CardItemsCard extends StatefulWidget {
  CardItemsCard({
    super.key,
    required this.initialSize,
    required this.sizes,
    required this.initialQuantity,
    required this.quantity,
  });

  late String initialSize;
  final List<String> sizes;
  late String initialQuantity;
  final List<String> quantity;

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
                  color: const Color.fromARGB(255, 166, 255, 255),
                  child: Image.asset(
                    logoPath,
                    height: 150,
                    // width: 10,
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
                    const Text('HIGHLANDER',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Men White Sneakers'),
                    const Text(
                      'Sold by: Maxwell Commerce',
                      style: TextStyle(fontSize: 11, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.zero,
                            height: 25,
                            decoration: BoxDecoration(
                              color: gGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Size: '),
                                  DropdownButton(
                                    iconSize: 20,

                                    alignment: Alignment.centerRight,
                                    underline:
                                        Container(color: Colors.transparent),
                                    menuMaxHeight: 300,

                                    value: widget.initialSize,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: widget.sizes.map((String sizes) {
                                      return DropdownMenuItem(
                                        value: sizes,
                                        child: Text(sizes),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        widget.initialSize = newValue!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.zero,
                            height: 25,
                            decoration: BoxDecoration(
                              color: gGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Qty: '),
                                  DropdownButton(
                                    iconSize: 20,

                                    alignment: Alignment.centerRight,
                                    underline:
                                        Container(color: Colors.transparent),
                                    menuMaxHeight: 300,

                                    value: widget.initialQuantity,

                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items:
                                        widget.quantity.map((String quantity) {
                                      return DropdownMenuItem(
                                        value: quantity,
                                        child: Text(quantity),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        widget.initialQuantity = newValue!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '₹ 698 ',
                          style: TextStyle(
                              color: gDarkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '₹ 4,365',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '84% OFF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffff406c)),
                        ),
                      ],
                    ),
                    RichText(
                      text: const TextSpan(
                          text: '14 days',
                          style: TextStyle(
                              color: gDarkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                          children: [
                            TextSpan(
                              text: ' return available',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.normal),
                            )
                          ]),
                    ),
                  ]),
            ),
          ),
          const Spacer(),
          const Expanded(
            flex: 1,
            child: Icon(Icons.close, size: 17),
          ),
        ],
      ),
    );
  }
}
