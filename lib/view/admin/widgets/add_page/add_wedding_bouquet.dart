// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';


class Add_bouqueta extends StatefulWidget {
  const Add_bouqueta({super.key});
  State<Add_bouqueta> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_bouqueta> {
      TextEditingController Bouquetcontroller = TextEditingController();
            TextEditingController BouquetLocatiocontroller = TextEditingController();

      TextEditingController BouquetPricecontroller = TextEditingController();
    


  
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
            MyTextfield(hintText: 'Bouquet Name', controller: Bouquetcontroller),
              MyTextfield(hintText: 'Location', controller: BouquetLocatiocontroller),
              MyTextfield(hintText: 'Price/Bouquet ₹', controller: BouquetPricecontroller),
              
            ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Bouquet_Name": Bouquetcontroller.text,
                      "Location": BouquetLocatiocontroller.text,
                      "Bouquet_price": BouquetPricecontroller.text,
                     
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Boquate")
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

