import 'package:evnt_shadow/view/admin/admin_hoamepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class JoinUs extends StatelessWidget {
  const JoinUs({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 760,
                    color: Colors.black,
                    child: Image.asset(
                      'assets/images/starting/ph1 (1).jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 760,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 570,
                      ),
                      const Center(
                        child: Text(
                          "Plan your Dream Wedding",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "ArchitectsDaughter",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Let's Plan Your Special Day Together",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Effortlessly and joyfully. Now you can say",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "I do to stress-free wedding planning!",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          height: 50,
                          width: 150,
                          child: GestureDetector(
                            onTap: () async {
                              {
                                User? user = await signInWithGoogle();
                                print("------------$user");
                                if (user != null) {
                                  if(user.uid == "inoljWaIoPagsSRleVElmYpr8Eu1"){
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Admins_home_page()),
                                  );
                                  }else{
                                  loginsucesfully(context: context);
                                  }
                                }
                              }
                              ;
                            },
                            child: Container(
                              height: 60,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/starting/Google__G__logo.svg.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text('Join Us')
                                ],
                              ),
                            ),
                          )),
                    ],
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
