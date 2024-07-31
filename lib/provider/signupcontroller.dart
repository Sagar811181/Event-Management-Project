import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();

  bool obscureSignupPassword = true;
changeObscureVisibility() {
    obscureSignupPassword = !obscureSignupPassword;
    notifyListeners();
  }

  Future<void> saveData(String email, String password) async {
    await FirebaseFirestore.instance.collection("demo").doc().set({
      "Email": email,
      "Password": password,
    });
  }

  Future<void> register(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  final SnackBar _successSnackBar = const SnackBar(
    content: Text("Signup Successfully"),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
  );

  final SnackBar _errorSnackBar = const SnackBar(
    content: Text("Liogin Failed"),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );

  validateForm(BuildContext context) async {
    if (signUpformKey.currentState!.validate()) {
      try {
        await register(
          emailController.text,
          passwordController.text,
        );
        await saveData(emailController.text, passwordController.text);
        ScaffoldMessenger.of(context).showSnackBar(_successSnackBar);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signin Failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar);
    }
  }
}
