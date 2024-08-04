// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditBoquate extends StatelessWidget {
  TextEditingController EditBoquatePricecontroller = TextEditingController();

  EditBoquate({super.key, required this.docId});
  final String docId;

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            FirebaseFirestore.instance.collection("Boquate").doc(docId).get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditBoquatePricecontroller.text = snapshot.data!["Price"];

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Bouquet price',
                      controller: EditBoquatePricecontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Price": EditBoquatePricecontroller.text,
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
