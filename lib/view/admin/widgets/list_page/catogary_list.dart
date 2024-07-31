// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:evnt_shadow/view/admin/widgets/add_page/add_catogary.dart';
// import 'package:flutter/material.dart';

// class Catogary_list extends StatelessWidget {
//   const Catogary_list({super.key});

//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const Add_Catogary()));
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.green,
//         ),
//       ),
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: StreamBuilder(
//           stream:
//               FirebaseFirestore.instance.collection("CatogaryName").snapshots(),
//           builder: (BuildContext context,
//               AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                   child: const CircularProgressIndicator(
//                 color: Colors.green,
//               ));
//             }
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var data = snapshot.data!.docs;

//                   return Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(12)),
//                           child: Padding(
//                               padding: const EdgeInsets.all(2),
//                               child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 data[index]["name"],
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 20,
//                                                     fontWeight:
//                                                         FontWeight.w800),
//                                               ),
//                                             ])
//                                       ])))));
//                 },
//               );
//             } else {
//               return Text("Error Loading Data");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
