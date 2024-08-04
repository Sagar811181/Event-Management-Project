// ignore_for_file: unused_element

import 'package:evnt_shadow/start/join.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServies2 extends ChangeNotifier {
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  Future<void> loginsucesfully({required BuildContext context}) async {
    {
      if (!context.mounted) return;
      Fluttertoast.showToast(msg: "Login sucesfully", textColor: Colors.green);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Bottom()),
      );
    }
  }

// logout

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signOutWithGoogle(BuildContext context) async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
    if (!context.mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => JoinUs(),
        ));
  }

  Future<void> logout(BuildContext context) async {
    // Show the loading dialog
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Sign out from Firebase Authentication
    await _auth.signOut();

    // Dismiss the loading dialog
    Navigator.of(context)
        .pop(); // This should ideally come before pushing a new route

    // Navigate to the JoinUs page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => JoinUs()),
    );
  }
}
