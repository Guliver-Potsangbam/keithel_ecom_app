import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../core/constants/colors.dart';

class BadgeNotiNo extends StatelessWidget {
  const BadgeNotiNo({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
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
    );
  }
}
