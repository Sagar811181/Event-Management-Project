// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';
class EditPhotography extends StatelessWidget {
   EditPhotography({super.key,required this.docId});
 final String docId;
  TextEditingController EditPhotographyNamecontroller = TextEditingController();
    TextEditingController EditPhotographyLocationcontroller = TextEditingController();
     TextEditingController EditPhotographyWeddingPhotocontroller = TextEditingController();
  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Photography")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditPhotographyNamecontroller.text = snapshot.data!["Name"];
            EditPhotographyLocationcontroller.text = snapshot.data!["Location"];
             EditPhotographyWeddingPhotocontroller.text = snapshot.data!["Wedding_Photos"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: EditPhotographyNamecontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: EditPhotographyLocationcontroller),
                
                      MyTextfield(
                      hintText: 'Wedding Photos',
                      controller: EditPhotographyWeddingPhotocontroller),
                     
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Name": EditPhotographyNamecontroller.text,
                          "Location": EditPhotographyLocationcontroller.text,
                          "Wedding_Photos": EditPhotographyWeddingPhotocontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Photography")
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