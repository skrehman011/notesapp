import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/models/notes_model.dart';
import 'package:notesapp/views/screens/screen_log_in.dart';
import 'package:notesapp/views/screens/screen_saved_notes.dart';

class LayoutHomePage extends StatelessWidget {
  const LayoutHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 80,
          centerTitle: true,
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          // actions: [
          //   IconButton(onPressed: (){
          //     FirebaseAuth.instance.signOut().then((value) => Get.to(ScreenLogIn()));
          //      }, icon:Icon(Icons.login, color: Colors.black,)),
          // ],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 33, top: 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('notes')
                .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator.adaptive());
              }
              List<Notes> notes = snapshot.data!.docs
                  .map((e) => Notes.fromMap(e.data() as Map<String, dynamic>))
                  .toList();
              return (notes.isEmpty)?Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,  ),
                child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/Illustration.png')).marginOnly( bottom: 10),
                        Text(
                          "Start Your Journey",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ).marginOnly(bottom: 15),
                        Text(
                          "Every big step start with small step.\n"
                              "    Notes your first idea and start \n"
                              "                     your journey!",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ).marginOnly(bottom: 15),
                        Image(image: AssetImage('assets/images/Arrow.png')).marginOnly(top: 15)
                      ],
                    )
                ),
              ):ListView.builder(
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) {
                  Notes note = notes[index];
                  return GestureDetector(
                    onTap: (){
                      Get.to(ScreenSavedNotes(notes: note,));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 101,
                      decoration: BoxDecoration(
                          color: Color(0xFF6A3EA1),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, bottom: 5, top: 10, right: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              note.title,
                              style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ).marginOnly(bottom: 10),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,

                              note.note,
                              style: TextStyle(
                                  color: Color(0xFFEFE9F7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ).marginOnly(bottom: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
