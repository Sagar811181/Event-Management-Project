// ignore_for_file: unused_local_variable, must_be_immutable, unnecessary_null_comparison

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add_Venue extends StatelessWidget {
  Add_Venue({super.key});

  TextEditingController Venuecontroller = TextEditingController();

  TextEditingController VenueLocationcontroller = TextEditingController();

  TextEditingController VenueIndoorcontroller = TextEditingController();

  TextEditingController VenueOutdoorcontroller = TextEditingController();

  TextEditingController VenueBanquetcontroller = TextEditingController();
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
              MyTextfield(hintText: 'Venue Name', controller: Venuecontroller),
              MyTextfield(
                  hintText: 'Location', controller: VenueLocationcontroller),
              MyTextfield(
                  hintText: 'Indoor/Day ₹', controller: VenueIndoorcontroller),
              MyTextfield(
                  hintText: 'Out Door/Day ₹',
                  controller: VenueOutdoorcontroller),
              MyTextfield(
                  hintText: 'Banquet Price/Day ₹',
                  controller: VenueBanquetcontroller),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      var _storageref = await FirebaseStorage.instance
                          .ref()
                          .child('/Venue/${imageFile!.path}')
                          .putFile(imageFile!);
                      var getImgUrl = await _storageref.ref.getDownloadURL();
                      var teamData = {
                        "Venue_Name": Venuecontroller.text,
                        "Location": VenueLocationcontroller.text,
                        "Indoor_Price": VenueIndoorcontroller.text,
                        "Outdoor_Price": VenueOutdoorcontroller.text,
                        "Banquet_Price": VenueBanquetcontroller.text,
                        "image": getImgUrl,
                      };
                      var db_ref = await FirebaseFirestore.instance
                          .collection("Venue")
                          .add(teamData);
                      if (!context.mounted) return;
                      Navigator.pop(context);
                    } catch (e) {
                      print("EXCEPTION --- $e");
                    }
                  },
                  child: Text(
                    "Submit",
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
