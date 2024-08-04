import 'package:evnt_shadow/view/user/widgets/Our_Mehanddhis.dart';
import 'package:evnt_shadow/view/user/widgets/Our_veneus.dart';
import 'package:evnt_shadow/view/user/widgets/home_screen_plan_widgets.dart';
import 'package:evnt_shadow/view/user/widgets/our_cake.dart';
import 'package:evnt_shadow/view/user/widgets/our_catering.dart';
import 'package:evnt_shadow/view/user/widgets/our_dinningset.dart';
import 'package:evnt_shadow/view/user/widgets/our_hosting_boys.dart';
import 'package:evnt_shadow/view/user/widgets/our_hosting_girls.dart';
import 'package:evnt_shadow/view/user/widgets/our_makeup.dart';
import 'package:evnt_shadow/view/user/widgets/our_photographer.dart';
import 'package:evnt_shadow/view/user/widgets/our_weddding_car.dart';
import 'package:evnt_shadow/view/user/widgets/our_wedding_card.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Homepage extends StatelessWidget {
  Homepage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        title: Text(
          'Event Shadow',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 25,
            color: Colors.white,
            fontFamily: "ArchitectsDaughter",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle save action
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusBarWidgets(),
              SizedBox(
                height: 25,
              ),
              Text(
                "Our Ideas",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Ideas(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Venue",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Wedding_Venues(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Wedding Dinning set",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              our_dinningset(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Wedding Mehandhi",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: 10,
              ),
              Our_Wedding_Mehandhi(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Makeup",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Makup(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Photography",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_photography(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Hosting Boys ",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Hosting_Boys(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Hosting Girls",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Hosting_Girls(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Wedding Card",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Wedding_Card(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Wedding Car",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_wedding_car(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Our Wedding Cake",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ArchitectsDaughter",
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              Our_Wedding_cake(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
