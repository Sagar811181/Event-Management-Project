// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditDinning extends StatelessWidget {

    TextEditingController EditDinningNameEditcontroller = TextEditingController();
    TextEditingController EditDinningIndoor_PriceEditcontroller = TextEditingController();
    TextEditingController EditDinningOutdoor_PriceEditcontroller = TextEditingController();
    TextEditingController EditDinningBanquet_PriceEditcontroller = TextEditingController();

  final String docId;
   EditDinning({super.key,required this.docId});

  
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("DinningSet")
            .doc(docId)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            EditDinningNameEditcontroller.text = snapshot.data!["Set_Name"];
            EditDinningIndoor_PriceEditcontroller.text = snapshot.data!["Indoor_Price"];
            EditDinningOutdoor_PriceEditcontroller.text = snapshot.data!["Outdoor_Price"];
            EditDinningBanquet_PriceEditcontroller.text = snapshot.data!["Banquet_Price"];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MyTextfield(
                      hintText: 'Set Name',
                      controller: EditDinningNameEditcontroller),
                  MyTextfield(
                      hintText: 'Indoor Price',
                      controller: EditDinningIndoor_PriceEditcontroller),
                  MyTextfield(
                      hintText: 'Outdoor Price',
                      controller: EditDinningOutdoor_PriceEditcontroller),
                      MyTextfield(
                      hintText: 'Banquet Price',
                      controller: EditDinningBanquet_PriceEditcontroller),
                  ElevatedButton(
                      onPressed: () async {
                        var teamData = {
                          "Set_Name": EditDinningNameEditcontroller.text,
                          "Indoor_Price": EditDinningIndoor_PriceEditcontroller.text,
                          "Outdoor_Price": EditDinningOutdoor_PriceEditcontroller.text,
                          "Banquet_Price": EditDinningBanquet_PriceEditcontroller.text,
                        };
                        var db_ref = await FirebaseFirestore.instance
                            .collection("DinningSet")
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