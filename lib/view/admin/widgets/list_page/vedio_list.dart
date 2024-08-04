import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/widgets/add_page/add_Vedios.dart';
import 'package:flutter/material.dart';

class Vedio_List extends StatelessWidget {
  const Vedio_List({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Add_Vedios()));
        },
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Story").snapshots(),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
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
                                    Spacer(),
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
                              ))));
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
