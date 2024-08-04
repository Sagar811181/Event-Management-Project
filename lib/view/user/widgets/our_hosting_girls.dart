import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Our_Hosting_Girls extends StatelessWidget {
  const Our_Hosting_Girls({
    super.key,
  });

  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("HostingGirls").snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            return SizedBox(
              height: 200,
              width: MediaQuery.sizeOf(context).width * .9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!;

                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Container(
                          height: 170,
                          width: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                data.docs[index]["image"],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => JoinUs()
                                //       //input the page
                                //       ),
                                // );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                "${data.docs[index]["Group_Name"]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "ArchitectsDaughter",
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "₹ ${data.docs[index]["Wages"]}/Person",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ]));
                },
              ),
            );
          } else {
            return Text(
              "Bo Dta Found",
              style: TextStyle(color: Colors.white),
            );
          }
        },
      ),
    );
  }
}
