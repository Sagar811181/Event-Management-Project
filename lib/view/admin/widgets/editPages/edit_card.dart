// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';
class EditCard extends StatelessWidget {
   EditCard({super.key,required this.docId});
 final String docId;
  TextEditingController EditCardNamecontroller = TextEditingController();
    TextEditingController EditCardLocationcontroller = TextEditingController();
  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Card")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditCardNamecontroller.text = snapshot.data!["Card_Name"];
            EditCardLocationcontroller.text = snapshot.data!["Price_Card"];
         
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Card Name',
                      controller: EditCardNamecontroller),
                  MyTextfield(
                      hintText: 'Price/Card',
                      controller: EditCardLocationcontroller),
                 
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Card_Name": EditCardNamecontroller.text,
                          "Price_Card": EditCardLocationcontroller.text,
                          
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Card")
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