// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditCake extends StatelessWidget {
  TextEditingController EdiCakeNamecontroller = TextEditingController();
    TextEditingController EditCakeLocationcontroller = TextEditingController();
    TextEditingController EditCakePricecontroller = TextEditingController();

   EditCake({super.key,required this.docId});
 final String docId;

  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Cake")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EdiCakeNamecontroller.text = snapshot.data!["Cake_Name"];
            EditCakeLocationcontroller.text = snapshot.data!["Location"];
            EditCakePricecontroller.text = snapshot.data!["Price"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Cake Name',
                      controller: EdiCakeNamecontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: EditCakeLocationcontroller),
                  MyTextfield(
                      hintText: 'Cake price',
                      controller: EditCakePricecontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Cake_Name": EdiCakeNamecontroller.text,
                          "location": EditCakeLocationcontroller.text,
                          "Price": EditCakePricecontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Cake")
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