import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/sizes.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Page'),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     // Get.offAll(() => Page1());
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(gDefaultSize - 20),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                title: const Text('All Categories'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Phone'),
                onTap: () {},
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: Colors.red,
                  title: const Text('TV & Smart Home'),
                  childrenPadding: const EdgeInsets.only(left: 20),
                  children: [
                    ListTile(
                      title: const Text('TV'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Smarter Living'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Smart Appliances'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: Colors.red,
                  title: const Text('Laptop & Tablet'),
                  childrenPadding: const EdgeInsets.only(left: 20),
                  children: [
                    ListTile(
                      title: const Text('Laptops'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Tablets'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  textColor: Colors.red,
                  title: const Text('Lifestyle'),
                  childrenPadding: const EdgeInsets.only(left: 20),
                  children: [
                    ListTile(
                      title: const Text('Powerbanks & Chargers'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Grooming and Hygiene'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Audio'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Wearables'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Apparels, Shoes & More'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Backpack & Travel'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
