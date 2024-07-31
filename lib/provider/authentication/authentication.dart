import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/admin/admin_hoamepage.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAuthentication extends ChangeNotifier {
  final _authenticationInstance = FirebaseAuth.instance;
  final _firestoreInstance = FirebaseFirestore.instance;

  createAccount({required email, required password}) async {
    var ref = await _authenticationInstance.createUserWithEmailAndPassword(
        email: email, password: password);

    if (ref.user!.uid.isNotEmpty) {
      var data = {"name": "", "email": email, "password": password};
      _firestoreInstance.collection("Users").add(data);
    }
  }

  appLogin(BuildContext context) async {
    var userID = "";
    if (userID == "ZEl6uPIGv8ciXxKEE70ybKsM9yr2") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Admins_home_page(),
          ));
    } else
      (Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          )));
  }
}
