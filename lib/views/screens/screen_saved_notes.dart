import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notesapp/models/notes_model.dart';


class ScreenSavedNotes extends StatelessWidget {
 Notes notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60,
        centerTitle: true,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Saved Notes', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black.withOpacity(.7),
                ),
              ).marginOnly(bottom: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15)),
                child:Text(notes.title, style: TextStyle(
                    color: Colors.grey.withOpacity(.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),)
              ).marginOnly(bottom: 15),
              Text(
                "Write your data here",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black.withOpacity(.7),
                ),
              ).marginOnly(bottom: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 244,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(notes.note, style: TextStyle(
                    color: Colors.grey.withOpacity(.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400) ,)
              ),

            ],
          )
        ),
      ),
    );
  }

 ScreenSavedNotes({
    required this.notes,
  });
}
