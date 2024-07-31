// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
import 'package:flutter/material.dart';

class Add_Car extends StatefulWidget {
  const Add_Car({super.key});
  State<Add_Car> createState() => _Add_CatogaryState();
}

class _Add_CatogaryState extends State<Add_Car> {
  TextEditingController Carcontroller = TextEditingController();
  TextEditingController CarModelcontroller = TextEditingController();
  TextEditingController CarPricecontroller = TextEditingController();
  TextEditingController Carlocationcontroller = TextEditingController();

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
              MyTextfield(hintText: 'Car Name', controller: Carcontroller),
              MyTextfield(hintText: 'Car Model', controller: CarModelcontroller),
              MyTextfield(hintText: 'Location', controller: Carlocationcontroller),
              MyTextfield(hintText: 'Price/Day ₹', controller: CarPricecontroller),
           ElevatedButton(
                  onPressed: () async {
                    var teamData = {
                      "Car_Name": Carcontroller.text,
                      "Model": CarModelcontroller.text,
                      "Location": Carlocationcontroller.text,
                      "Price": CarPricecontroller.text,
                    };
                    var db_ref = await FirebaseFirestore.instance
                        .collection("Car")
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
