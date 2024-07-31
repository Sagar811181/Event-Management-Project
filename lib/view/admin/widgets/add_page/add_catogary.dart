// import 'package:evnt_shadow/provider/admin/catering/manage_catogary.dart';
// import 'package:evnt_shadow/view/admin/costom_widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Add_Catogary extends StatefulWidget {
//   const Add_Catogary({super.key});

//   State<Add_Catogary> createState() => _Add_CatogaryState();
// }

// class _Add_CatogaryState extends State<Add_Catogary> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Consumer<Mannage_CatogaryProvider>(builder:
//             (BuildContext context, Mannage_CatogaryProvider value,
//                 Widget? child) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 40,
//                 ),
//                 MyTextfield(
//                     hintText: 'Add New Plan',
//                     controller: value.catogarynamecontroller),
//                 ElevatedButton(
//                     onPressed: () {
//                       Provider.of<Mannage_CatogaryProvider>(context,
//                               listen: false)
//                           .submitCategoryData(context);
//                     },
//                     child: Text("Submit"),
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.green),
//                       foregroundColor:
//                           MaterialStateProperty.all<Color>(Colors.white),
//                     )),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
