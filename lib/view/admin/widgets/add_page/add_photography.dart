// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Add_Photography extends StatefulWidget {
  const Add_Photography({super.key});

  State<Add_Photography> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Photography> { 
      TextEditingController Photographeycontroller = TextEditingController();
            TextEditingController PhotographeyLocationcontroller = TextEditingController();

            TextEditingController Albumcontroller = TextEditingController();
      TextEditingController SaveTheDatecontroller = TextEditingController();

      TextEditingController WeddingPicscontroller = TextEditingController();


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
               MyTextfield(hintText: 'Name', controller: Photographeycontroller),
              MyTextfield(hintText: 'Location', controller: PhotographeyLocationcontroller),
              MyTextfield(hintText: 'Save The Date ₹', controller: SaveTheDatecontroller),
             MyTextfield(hintText: 'Wedding Photos ₹ ', controller: WeddingPicscontroller),
              MyTextfield(hintText: 'Album & Wedding Photos ₹', controller: Albumcontroller),


              
            ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Name": Photographeycontroller.text,
                      "Location": PhotographeyLocationcontroller.text,
                      "Save_The_Date": SaveTheDatecontroller.text,
                      "Wedding_Photos": WeddingPicscontroller.text,
                      "Album_Wedding_Photos": Albumcontroller.text,
                      
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Photography")
                        .add(teamData);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                  child: Text("Submit",),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

