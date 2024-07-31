import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/provider/authentication/google_authentication.dart';
import 'package:evnt_shadow/start/join.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/catering.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/dinning_set.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/hosting_boys.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/hosting_girls.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/makeup.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/mehandhi.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/photography.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/story.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/veneue.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/wedding_bokka.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/wedding_cake.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/wedding_car.dart';
import 'package:evnt_shadow/view/admin/widgets/main_widgets/wedding_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Admins_home_page extends StatefulWidget {
  const Admins_home_page({super.key});

  State<Admins_home_page> createState() => _Admins_home_pageState();
}

class _Admins_home_pageState extends State<Admins_home_page> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Event Shadow',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 25,
            color: Colors.white,
            fontFamily: "ArchitectsDaughter",
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (String result) {
              print(result); // Handle your logic here
              if (result == 'EditField') {
                // Logic for edit button click
                print('Edit button clicked');
              } else if (result == 'DeleteField') {
                // Logic for delete button click
                FirebaseFirestore.instance.collection("CateringTeam");
                print('Delete button clicked');
              } else if (result == 'Logout') {
                // Logic for logout button click
                Provider.of<AuthServies>(context, listen: false)
                    .signOutWithGoogle()
                    .then((lg) async {
                  if (lg) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Center(child: CircularProgressIndicator()),
                    );
                    await Future.delayed(
                        Duration(seconds: 2)); // Simulate async operation
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => JoinUs()));
                  }
                });
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Logout',
                child: Text(
                  'Logout',
                  style: TextStyle(color: Color.fromARGB(255, 198, 52, 42)),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Color.fromARGB(255, 62, 61, 61),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: homePageWidgets.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
            itemBuilder: (context, index) {
              return homePageWidgets[index];
            },
          ),
        ),
      ),
    );
  }
}

List<Widget> homePageWidgets = [
  Add_Story(),
  // Manage_Catogary(),
  Manage_Catering(),
  Manage_Dinnigset(),
  Manage_Photography(),
  Manage_Venue(),
  Manage_Hosting_Boys(),
  Manage_Hosting_girls(),
  Manage_Bokka(),
  Manage_Cake(),
  Manage_Makeup(),
  Manage_Mehandhi(),
  Manage_Car(),
  Manage_Card(),
];
