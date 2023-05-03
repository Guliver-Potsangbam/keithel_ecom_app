import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keithel/src/core/constants/sizes.dart';
import 'package:keithel/src/dashboard_module/logic/profile_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(
            'User Management',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(gDefaultSize),
          child: StreamBuilder<QuerySnapshot>(
            stream: profileController.getAllUsersStream(),
            builder: (context, snapshot) {
              // if (!snapshot.hasData) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              // return ListView(
              //   children: snapshot.data!.docs.map((document) {
              //     return Center(child: Text(document['fullName']));
              //   }).toList(),
              // );

              if (snapshot.hasError) {
                print('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final List storedocs = [];
              snapshot.data!.docs.map((document) {
                Map a = document.data() as Map<String, dynamic>;
                storedocs.add(a);
                storedocs
                    .sort((a, b) => a['timestamp'].compareTo(b['timestamp']));
              }).toList();

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: storedocs.length,
                  itemBuilder: (c, index) {
                    return Column(
                      children: [
                        ListTile(
                          iconColor: Colors.blue,
                          tileColor: Colors.blue.withOpacity(0.1),
                          leading: const Icon(LineAwesomeIcons.user),
                          title: Text("Name: ${storedocs[index]['fullName']}"),
                          subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(storedocs[index]['phoneNo']),
                                Text(storedocs[index]['email']),
                              ]),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
