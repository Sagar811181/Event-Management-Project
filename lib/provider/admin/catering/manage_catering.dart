// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CateringManagement extends ChangeNotifier {
  TextEditingController CateringNamecontroller = TextEditingController();
  TextEditingController CateringLocationcontroller = TextEditingController();
  TextEditingController PerPersoncontroller = TextEditingController();

  File? imageFile;

  Future chooseImage() async {
    ImagePicker picker = ImagePicker();

    var PickedFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(PickedFile!.path);

    if (PickedFile != null) {
      imageFile = File(PickedFile.path);
      notifyListeners();
    } else {
      print("No Image Picked");
    }
  }

  submitData(BuildContext context) async {
    try {
      if(imageFile!= null){
         var _storageref = await FirebaseStorage.instance
          .ref()
          .child('/cateringTeam/${imageFile!.path}')
          .putFile(imageFile!);
      var getImgUrl = await _storageref.ref.getDownloadURL();

      var teamData = {
        "group_name": CateringNamecontroller.text,
        "location": CateringLocationcontroller.text,
        "wages": PerPersoncontroller.text,
        "image": getImgUrl,
      };
      var db_ref = await FirebaseFirestore.instance
          .collection("CateringTeam")
          .add(teamData);
      if (!context.mounted) return;
      Navigator.pop(context);
   
      }
     } catch (e) {
      print("EXCEPTION --- $e");
    }
  }
}
