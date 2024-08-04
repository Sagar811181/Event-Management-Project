import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/widgets/add_page/add_Images.dart';
import 'package:flutter/material.dart';

class Image_List extends StatelessWidget {
  const Image_List({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Add_Images()));
        },
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("allImage").snapshots(),
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
