import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/dashboard_module/logic/profile_controller.dart';
import 'package:keithel/src/user_module/logic/user_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/image_strings.dart';
import '../../core/constants/text_strings.dart';
import 'profile_page.dart';

@RoutePage()
class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  @override
  void initState() {
    initCountry();
    super.initState();
  }

  Country? _selectedCountry;

  void initCountry() async {
    // final country = await getDefaultCountry(context);
    final country = await getCountryByCountryCode(context, 'IN');
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    final profileController = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.router.pop();
                },
                icon: const Icon(LineAwesomeIcons.angle_left)),
            title: Text(
              gEditProfile,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(gDefaultSize),
              child: FutureBuilder(
                future: profileController.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel user = snapshot.data as UserModel;

                      //Controllers
                      final fullName =
                          TextEditingController(text: user.fullName);
                      final email = TextEditingController(text: user.email);
                      final password =
                          TextEditingController(text: user.password);
                      final phoneNo = TextEditingController(
                          text: user.phoneNo.substring(3));
                      final address = TextEditingController(text: user.address);

                      return Column(children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      image: AssetImage(gProfileImage))),
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
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullName,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Enter your full name";
                                //   }
                                // },
                                decoration: const InputDecoration(
                                  label: Text("Full Name"),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded),
                                ),
                              ),
                              const SizedBox(height: gFormHeight - 20),
                              TextFormField(
                                controller: email,
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.!#$%&'*+-/==?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]")
                                      .hasMatch(value!);

                                  if (value.isEmpty) {
                                    return "Enter Email";
                                  } else if (!emailValid) {
                                    return "Enter Valid Email";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  label: Text("Email"),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              const SizedBox(height: gFormHeight - 20),
                              TextFormField(
                                controller: password,

                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Enter Password";
                                //   } else if (controller.password.length < 6) {
                                //     return "Password length should be atleast 6 characters";
                                //   }
                                // },
                                decoration: const InputDecoration(
                                  label: Text("Password"),
                                  prefixIcon: Icon(Icons.lock_outline_rounded),
                                ),
                              ),
                              const SizedBox(height: gFormHeight - 20),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneNo,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Enter Phone Number";
                                //   } else if (controller.phoneNo.length != 10) {
                                //     return "Phone Number should be exactly 10 digits";
                                //   }
                                // },
                                maxLength: 10,
                                decoration: InputDecoration(
                                  label: const Text("Phone Number"),
                                  prefixIcon: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final country =
                                                await showCountryPickerSheet(
                                              context,
                                            );
                                            if (country != null) {
                                              setState(() {
                                                _selectedCountry = country;
                                              });
                                            }
                                          },
                                          child: country == null
                                              ? Container()
                                              : Column(
                                                  children: <Widget>[
                                                    Image.asset(
                                                      country.flag,
                                                      package:
                                                          countryCodePackageName,
                                                      width: 30,
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: gFormHeight - 20),
                              TextFormField(
                                controller: address,
                                maxLines: 2,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Enter Address";
                                //   }
                                // },
                                decoration: const InputDecoration(
                                  label: Text("Address"),
                                  prefixIcon: Icon(Icons.location_pin),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: gFormHeight),

                        //Elevated Button [Form Submit Button]

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final userData = UserModel(
                                fullName: fullName.text.trim(),
                                email: email.text.trim(),
                                password: password.text.trim(),
                                phoneNo: country!.callingCode.trim() +
                                    phoneNo.text.trim(),
                                address: address.text.trim(),
                                timestamp: FieldValue.serverTimestamp(),
                              );

                              await profileController.updateRecord(userData);
                              // Get.to(() => ProfilePage());
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: gPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(
                              gEditProfile,
                              style: TextStyle(color: gDarkColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: gFormHeight),

                        //Joined Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(
                              TextSpan(
                                  text: gJoined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: ' $gJoinedAt',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )
                                  ]),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: const StadiumBorder(),
                                side: BorderSide.none,
                              ),
                              child: const Text(gDelete),
                            ),
                          ],
                        ),
                      ]);
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          )),
    );
  }
}
