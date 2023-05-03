import 'package:flutter/material.dart';

import '../../core/constants/image_strings.dart';
import '../../core/constants/text_strings.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(gWelcomeScreenImage),
          height: size.height * 0.2,
        ),
        Text(gLoginTitle, style: Theme.of(context).textTheme.displayLarge),
        Text(gLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
