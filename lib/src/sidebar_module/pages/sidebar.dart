import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/user_module/logic/user_model.dart';
import '../../core/constants/image_strings.dart';

class SideBarPage extends StatelessWidget {
  const SideBarPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: screenSize.height * 1,
        width: screenSize.width * 0.7,
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              // bottomRight: Radius.circular(50),
            ),
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 200,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: gBlackColor,
                    // borderRadius:
                    //     BorderRadius.only(topRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      // Text('Drawer Header'),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                const Image(image: AssetImage(gProfileImage))),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.fullName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: gSoftWhiteColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        user.email,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: gSoftWhiteColor),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.pop(context);
                  // Get.to(() => ProfilePage(user: user));
                },
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () async {
                  // SharedPreferences pref =
                  //     await SharedPreferences.getInstance();
                  // // Update the state of the app
                  // SignOutController.instance.signOut();
                  // if (pref.containsKey('user')) {
                  //   pref.remove('user');
                  // }
                  // // Then close the drawer
                  // // Navigator.pop(context);
                  // context.router.push(const WelcomeRoute());
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
