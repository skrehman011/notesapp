import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controllers/notes_controller.dart';
import 'package:notesapp/views/screens/screen_home.dart';

class ScreenAddNotes extends StatelessWidget {

  NotesController addController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 100,
        centerTitle: true,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Add Notes', style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
          child: Column(
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
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  maxLines: 1,

                  controller: addController.titleController,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Khalil ur Rehman',
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
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
                height: 244,
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  maxLines: null,
                  controller: addController.noteController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your data here',
                    hintStyle: TextStyle(
                      overflow: TextOverflow.ellipsis,

                        color: Colors.grey.withOpacity(.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ).marginOnly(bottom: 95),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF6A3EA1),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await addController.Saved();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Saved',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  )).marginOnly(bottom: 10)


            ],
          ),
        ),
      ),
    );
  }
}
