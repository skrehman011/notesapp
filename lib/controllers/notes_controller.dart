import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notesapp/models/notes_model.dart';
import 'package:notesapp/views/layouts/layout_home_page.dart';

class NotesController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();



  Future<void> Saved() async {
    String title = titleController.text.trim();
    String note = noteController.text.trim();


    if (title.isEmpty || note.isEmpty) {
      Get.snackbar('Alert', 'Fill all the fields');
    } else {



      String noteId =DateTime.now().millisecondsSinceEpoch.toString();


      Notes notes = Notes(
          id: noteId,
          title: title,
          note: note,
          userId: FirebaseAuth.instance.currentUser!.uid
      );

      await FirebaseFirestore.instance.collection('notes').doc(noteId).set(
          notes.toMap()).then((value) {
        Get.snackbar('Congrats 😍', 'Note Saved Successfully 😁');
        titleController.clear();
        noteController.clear();
      }).catchError((error) {
        Get.snackbar('Alert 😒', 'Notes not stored');
      });
    }
  }
}
