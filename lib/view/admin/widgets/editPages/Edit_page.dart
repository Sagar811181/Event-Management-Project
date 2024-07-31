// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Catering_Editpage extends StatelessWidget {
  TextEditingController CateringNameEditcontroller = TextEditingController();
  TextEditingController CateringLocationEditcontroller = TextEditingController();
  TextEditingController PerPersonEditcontroller = TextEditingController();

  Catering_Editpage({super.key, required this.docId});

  final String docId;

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("CateringTeam")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            CateringNameEditcontroller.text = snapshot.data!["group_name"];
            CateringLocationEditcontroller.text = snapshot.data!["location"];
            PerPersonEditcontroller.text = snapshot.data!["wages"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: CateringNameEditcontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: CateringLocationEditcontroller),
                  MyTextfield(
                      hintText: 'Wages/Day ₹',
                      controller: PerPersonEditcontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "group_name": CateringNameEditcontroller.text,
                          "location": CateringLocationEditcontroller.text,
                          "wages": PerPersonEditcontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("CateringTeam")
                            .doc(docId)
                            .update(teamData);
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        
                      },
                      
                      child: Text("Update"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )),
                ],
              ),
            );
          } else {
            return Text("no data to edit");
          }
        },
      ),
    );
  }
}
