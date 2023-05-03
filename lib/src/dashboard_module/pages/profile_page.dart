import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/core/constants/colors.dart';
import 'package:keithel/src/core/constants/image_strings.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/core/router/app_route.gr.dart';
import 'package:keithel/src/user_module/pages/user_management_page.dart';
import 'package:keithel/src/utils/theme/theme.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../core/constants/text_strings.dart';
import '../../user_module/logic/user_model.dart';
import '../widgets/profile_menu_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       Get.offAll(() => const DashboardPage());
          //     },
          //     icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(
            gProfile,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // [[Some error here]]

                Get.changeTheme(
                  Get.isDarkMode ? GAppTheme.lightTheme : GAppTheme.darkTheme,
                );
              },
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(gDefaultSize),
            child: Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(gProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: gPrimaryColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                user.fullName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                user.email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const UpdateProfileRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gPrimaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    gEditProfile,
                    style: TextStyle(color: gDarkColor),
                  ),
                ),
              ),

              // Divider

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // MENU
              ProfileMenuWidget(
                title: gMenu1,
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: gMenu2,
                icon: LineAwesomeIcons.box,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: gMenu3,
                icon: LineAwesomeIcons.user,
                onPress: () {
                  Get.to(() => const UserManagementPage());
                },
              ),

              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: gMenu4,
                icon: LineAwesomeIcons.headset,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: gMenu5,
                textColor: Colors.red,
                isEndIcon: false,
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
