import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/start/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registercontroller extends ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  bool _obscureRegisterPassword = true;

  bool get obscurePassword => _obscureRegisterPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  
  void dispose() {
    super.dispose();

    namecontroller.dispose();
    phonenumbercontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  Future<void> saveData(String name, String email, String number) async {
    await FirebaseFirestore.instance.collection("users").doc(email).set({
      "Name": name,
      "Email": email,
      "Number": number,
    });
  }

  Future<void> register(String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  changeObscureVisibility() {
    _obscureRegisterPassword = !_obscureRegisterPassword;
    notifyListeners();
  }

  validateForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await register(
          emailcontroller.text,
          passwordcontroller.text,
        );
        await saveData(
          namecontroller.text,
          emailcontroller.text,
          phonenumbercontroller.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Signinpage(),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup Failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }

  final SnackBar successSnackBar = const SnackBar(
    content: Text("Signup Successfully"),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
  );

  final SnackBar errorSnackBar = const SnackBar(
    content: Text("Signup Failed"),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
  );
}
