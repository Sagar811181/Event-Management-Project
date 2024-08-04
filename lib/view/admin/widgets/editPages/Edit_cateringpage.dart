// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Idea_Editpage extends StatelessWidget {
  TextEditingController IdeaNameEditcontroller = TextEditingController();
  TextEditingController IdeaLocationEditcontroller = TextEditingController();
  TextEditingController IdeaEditcontroller = TextEditingController();

  Idea_Editpage({super.key, required this.docId});

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
            IdeaNameEditcontroller.text = snapshot.data!["group_name"];
            IdeaLocationEditcontroller.text = snapshot.data!["location"];
            IdeaEditcontroller.text = snapshot.data!["wages"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: IdeaNameEditcontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: IdeaLocationEditcontroller),
                  MyTextfield(
                      hintText: 'Wages/Day ₹',
                      controller: IdeaEditcontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "group_name": IdeaNameEditcontroller.text,
                          "location": IdeaLocationEditcontroller.text,
                          "wages": IdeaEditcontroller.text,
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
