// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';
class EditMakeup extends StatelessWidget {
   EditMakeup({super.key,required this.docId});
 final String docId;
  TextEditingController EditMakeupNamecontroller = TextEditingController();
    TextEditingController EditMakeupLocationcontroller = TextEditingController();
    TextEditingController EditMakeupPricecontroller = TextEditingController();
  
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("MakeUp")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditMakeupNamecontroller.text = snapshot.data!["Name"];
            EditMakeupLocationcontroller.text = snapshot.data!["Location"];
            EditMakeupPricecontroller.text = snapshot.data!["MakeUp_Price"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Group Name',
                      controller: EditMakeupNamecontroller),
                  MyTextfield(
                      hintText: 'Location',
                      controller: EditMakeupLocationcontroller),
                  MyTextfield(
                      hintText: 'MakeUp price/Person',
                      controller: EditMakeupPricecontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Name": EditMakeupNamecontroller.text,
                          "Location": EditMakeupLocationcontroller.text,
                          "MakeUp": EditMakeupPricecontroller.text,
                    
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("MakeUp")
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