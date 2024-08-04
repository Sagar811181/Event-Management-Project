// ignore_for_file: unused_local_variable, unnecessary_null_comparison, must_be_immutable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add_Catering extends StatelessWidget {
  Add_Catering({super.key});

  TextEditingController IdeaNamecontroller = TextEditingController();

  TextEditingController IdeaLocationcontroller = TextEditingController();

  TextEditingController PerPersoncontroller = TextEditingController();

  File? imageFile;

  Future chooseImage() async {
    ImagePicker picker = ImagePicker();

    var PickedFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(PickedFile!.path);

    if (PickedFile != null) {
      imageFile = File(PickedFile.path);
    } else {
      print("No Image Pickd");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      chooseImage();
                    },
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: imageFile != null
                            ? Image.file(
                                imageFile!.absolute,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  color: Colors.grey,
                                ),
                              )),
                  )
                ],
              ),
              MyTextfield(
                  hintText: 'Group Name', controller: IdeaNamecontroller),
              MyTextfield(
                  hintText: 'Location', controller: IdeaLocationcontroller),
              MyTextfield(
                  hintText: 'Wages/Day ₹', controller: PerPersoncontroller),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      var _storageref = await FirebaseStorage.instance
                          .ref()
                          .child('/Ideas/${imageFile!.path}')
                          .putFile(imageFile!);
                      var getImgUrl = await _storageref.ref.getDownloadURL();

                      var teamData = {
                        "group_name": IdeaNamecontroller.text,
                        "location": IdeaLocationcontroller.text,
                        "wages": PerPersoncontroller.text,
                        "image": getImgUrl,
                      };
                      var db_ref = await FirebaseFirestore.instance
                          .collection("Ideas")
                          .add(teamData);
                      if (!context.mounted) return;
                      Navigator.pop(context);
                    } catch (e) {
                      print("EXCEPTION --- $e");
                    }
                  },
                  child: Text("Submit"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}