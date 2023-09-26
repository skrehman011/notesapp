import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/views/screens/screen_log_in.dart';

import '../../models/student_model.dart';

class LayoutProfile extends StatelessWidget {
  const LayoutProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 100,
        centerTitle: true,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              ;
              var data = snapshot.data!.data() as Map<String, dynamic>;
              var user = Student.fromMap(data);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ).marginOnly(bottom: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_rounded,
                        color: Colors.grey,
                      ).marginOnly(right: 8),
                      Text(
                        "${user.email}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ).marginOnly(top: 3),
                    ],
                  ).marginOnly(bottom: 25),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 5),
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.1, 0.1),
                        //     blurRadius: 2,
                        //     spreadRadius: 0,
                        //   ),
                        // ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: TextButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .signOut()
                              .then((value) => Get.offAll(ScreenLogIn()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 25,
                            ).marginOnly(right: 10),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )).marginOnly(bottom: 10),
                ],
              );
            },
          )),
    );
  }
}
