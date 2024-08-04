import 'package:evnt_shadow/provider/authentication/google_authentication.dart';
import 'package:evnt_shadow/provider/registercoltroller.dart';
import 'package:evnt_shadow/view/user/widgets/bottom/bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<Registercontroller>(
      builder: (BuildContext context, Registercontroller value, Widget? child) {
        return Center(
          child: SingleChildScrollView(
            child: Form(
              key: value.formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 760,
                            color: Colors.black,
                            child: Image.asset(
                              'assets/images/starting/ph 18 (1).jpg',
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
                                  Colors.black,
                                  Colors.transparent,
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                constraints.maxWidth > 600 ? 32.0 : 16.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                const Center(
                                  child: Text(
                                    "Event Shadow",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: "ArchitectsDaughter",
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 80),
                                Column(
                                  children: [
                                    Text(
                                      "Register",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    TextFormField(
                                      controller: value.namecontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please input your name';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person_4_outlined,
                                          color: Colors.white,
                                        ),
                                        hintText: 'Name',
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      controller: value.emailcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please input your email';
                                        }
                                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                            .hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: Colors.white,
                                        ),
                                        hintText: 'Email',
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      controller: value.phonenumbercontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please input your phone number';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.local_phone_outlined,
                                          color: Colors.white,
                                        ),
                                        hintText: 'Phone Number',
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextFormField(
                                      controller: value.passwordcontroller,
                                      obscureText: value.obscurePassword,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please input your password';
                                        }
                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters long';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.white,
                                        ),
                                        hintText: 'Password',
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            value.obscurePassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          color: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {
                                    Provider.of<Registercontroller>(context,
                                            listen: false)
                                        .validateForm(context);
                                    //  signInWithGoogle();
                                    //       loginsucesfully(email: emai, password: password, context: context);
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already Have An Account?",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(width: 15),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Bottom(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Sign in",
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.green,
                                              )),
                                          child: IconButton(
                                            onPressed: () async {
                                              User? user =
                                                  await Provider.of<AuthServies2>(context,listen: false).signInWithGoogle();
                                              print("------------$user");
                                              if (user != null) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Bottom()),
                                                );
                                              }
                                            },
                                            icon: Icon(
                                              Icons.g_mobiledata_rounded,
                                              color: Colors.green,
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    ));
  }
}
