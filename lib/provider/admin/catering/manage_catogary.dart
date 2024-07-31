// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Mannage_CatogaryProvider extends ChangeNotifier {
//   TextEditingController catogarynamecontroller = TextEditingController();

//   submitCategoryData(BuildContext context) async {
//     var CatogaryData = {
//       "name": catogarynamecontroller.text,
//     };
//     var db_ref = await FirebaseFirestore.instance
//         .collection("CatogaryName")
//         .add(CatogaryData);
//     if (!context.mounted) return;
//     Navigator.pop(context);
//   }
// }
