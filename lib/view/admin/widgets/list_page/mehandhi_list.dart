import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/widgets/add_page/add_mehandhi.dart';
import 'package:evnt_shadow/view/admin/widgets/editPages/edit_mehandhi.dart';
import 'package:flutter/material.dart';

class Mehandhi_list extends StatelessWidget {
  const Mehandhi_list({super.key});

  
  Widget build(BuildContext context) {
    return 
     Scaffold(floatingActionButton: FloatingActionButton(onPressed: (){

      Navigator.push(context,
            MaterialPageRoute(builder: (context) => Add_Mehandhi()));

     },child: 
     Icon(Icons.add,color: Colors.green,),),
       body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Mehandhi").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: const CircularProgressIndicator(
                color: Colors.green,
              ));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data!.docs;

                  return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data[index]["Name"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),Container(
                                              height: 80,
                                              width: 80,
                                              color: Colors.white,
                                              child: data[index]["image"] == ""
                                                  ? Icon(Icons.person)
                                                  : Image(
                                                      image: NetworkImage(
                                                          data[index]["image"]),
                                                      fit: BoxFit.cover,
                                                    ),
                                            )
                                           
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "location : ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              data[index]["Location"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(children: [
                                          Text(
                                            "Mehandhi/person : ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data[index]["Mehandhi_price"],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),Spacer(), PopupMenuButton<String>(
                                              iconColor: Colors.white,
                                              onSelected: (String result) {
                                                print(
                                                    result); // Handle your logic here
                                                if (result == 'EditField') {
                                                  // Logic for edit button click
                                                  print('Edit button clicked');
                                                } else if (result ==
                                                    'DeleteField') {
                                                  // Logic for delete button click
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          "Mehandhi")
                                                      .doc(data[index].id)
                                                      .delete();
                                                  print(
                                                      'Delete button clicked');
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) =>
                                                      <PopupMenuEntry<String>>[
                                                PopupMenuItem<String>(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditMehandi(
                                                                docId:
                                                                    data[index]
                                                                        .id,
                                                              )),
                                                    );
                                                  },
                                                  value: 'EditField',
                                                  child: Text('Edit'),
                                                ),
                                                PopupMenuItem<String>(
                                                  value: 'DeleteField',
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 198, 52, 42)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ])
                                      ])))));
                },
              );
            } else {
              return Text("Error Loading Data");
            }
          },
        ),
      ),
     );
  }
}