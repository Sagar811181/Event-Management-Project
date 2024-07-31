import 'package:evnt_shadow/provider/authentication/google_authentication.dart';
import 'package:evnt_shadow/start/join.dart';
import 'package:evnt_shadow/start/signinpage.dart';
import 'package:evnt_shadow/view/user/widgets/Allabout.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/favorate.dart';
import 'package:evnt_shadow/view/user/widgets/faq.dart';
import 'package:evnt_shadow/view/user/widgets/prfl_details.dart';
import 'package:evnt_shadow/view/user/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 108, 106, 106),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      size: 50,
                    ),
                  ),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Color.fromARGB(255, 110, 108, 108),
                      )),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Username",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Text(
                    "www@gmail.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Prf_Details(),
                          //input the page
                        ),
                      );
                    },
                    child: Container(
                        width: 330,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Favorate_page()
                            //input the page
                            ),
                      );
                    },
                    child: Container(
                        width: 330,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Favorate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => All_About(),
                          //input the page
                        ),
                      );
                    },
                    child: Container(
                        width: 330,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.donut_large_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "About",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('Container Tapped');
                    },
                    child: Container(
                        width: 330,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsAndConditionsPage(),
                          //input the page
                        ),
                      );
                    },
                    child: Container(
                        width: 330,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.privacy_tip_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Privacy & Policy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Faq_page(),
                          //input the page
                        ),
                      );
                    },
                    child: Container(
                        width: 330,
                        height: 40,
                        child: Row(
                          children: [
                            Icon(
                              Icons.wallet_membership_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "FAQ,s",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Divider(
                color: Color.fromARGB(255, 53, 52, 52),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signinpage()),
                      );
                    },
                    child: InkWell(
                      onTap: () async {
                        var lg = await Provider.of<AuthServies>(context,
                                listen: false)
                            .signOutWithGoogle();
                        if (lg) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                    child: CircularProgressIndicator());
                              });

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => JoinUs()),
                          );
                        }
                      },
                      child: Container(
                          width: 330,
                          height: 40,
                          child: Row(
                            children: [
                              Icon(
                                Icons.login_rounded,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
