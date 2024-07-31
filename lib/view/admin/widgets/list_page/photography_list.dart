import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/widgets/add_page/add_photography.dart';
import 'package:evnt_shadow/view/admin/widgets/editPages/Edit_catering_page.dart';
import 'package:flutter/material.dart';
class Photography_List extends StatelessWidget {
  const Photography_List({super.key});

  
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Add_Photography()));

        },
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      backgroundColor: Colors.black,
       body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("Photography").snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
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
                                              data[index]["group_name"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            PopupMenuButton<String>(
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
                                                          "Photography")
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
                                                              Catering_Editpage(
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
                                              data[index]["location"],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(children: [
                                          Text(
                                            "Save The Date ₹: ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data[index]["Save The Date ₹"],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ]),
                                        Row(children: [
                                          Text(
                                            "Wedding Photos ₹: ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data[index]["Wedding Photos ₹"],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ]),
                                        Row(children: [
                                          Text(
                                            "Album & Wedding Photos ₹: ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data[index]["Album & Wedding Photos ₹"],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ]),
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