// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditBoquate extends StatelessWidget {


    TextEditingController EditBoquateNamecontroller = TextEditingController();
    TextEditingController EditBoquateLocationcontroller = TextEditingController();
    TextEditingController EditBoquatePricecontroller = TextEditingController();


   EditBoquate({super.key , required this.docId});
 final String docId;
  
  Widget build(BuildContext context) {
    return  Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Boquate")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditBoquateNamecontroller.text = snapshot.data!["Bouquet_Name"];
            EditBoquateLocationcontroller.text = snapshot.data!["Location"];
            EditBoquatePricecontroller.text = snapshot.data!["Bouquet_price"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: EditBoquateNamecontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: EditBoquateLocationcontroller),
                  MyTextfield(
                      hintText: 'Bouquet_price',
                      controller: EditBoquatePricecontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "group_name": EditBoquateNamecontroller.text,
                          "location": EditBoquateLocationcontroller.text,
                          "wages": EditBoquatePricecontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("Boquate")
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