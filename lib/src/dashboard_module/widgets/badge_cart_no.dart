import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:keithel/src/core/router/app_route.gr.dart';

import '../../core/constants/colors.dart';
import '../../user_module/logic/user_model.dart';

class BadgeCartNo extends StatelessWidget {
  BadgeCartNo({super.key, required this.user});

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (context, snapshot) {
          final List cartItems = [];
          if (snapshot.hasData) {
            snapshot.data!.docs
                .map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
              Map a = e.data();
              cartItems.add(a);
            }).toList();

            return
                // My Cart Action Button
                badges.Badge(
              position: badges.BadgePosition.topEnd(top: 3, end: 7),
              badgeStyle: badges.BadgeStyle(
                badgeColor:
                    cartItems.isEmpty ? Colors.transparent : gBadgeColor,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
              ),
              badgeContent: cartItems.isEmpty
                  ? const SizedBox()
                  : Text(
                      cartItems.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
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
            );
          }
          return Container();
        });
  }
}
