import 'package:evnt_shadow/provider/signupcontroller.dart';
import 'package:evnt_shadow/start/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Signinpage extends StatelessWidget {
  const Signinpage({super.key});

  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignUpController>(
        builder: (BuildContext context, SignUpController value, Widget? child) {
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: value.signUpformKey,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 760,
                          color: Colors.black,
                          child: Image.asset(
                            'assets/images/starting/ph 18 (2).jpg',
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
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const SizedBox(height: 90),
                              const Center(
                                child: Text(
                                  "Big Day Buddy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontFamily: "ArchitectsDaughter",
                                  ),
                                ),
                              ),
                              const SizedBox(height: 150),
                              Column(
                                children: [
                                  const SizedBox(height: 30),
                                  TextFormField(
                                    controller: value.emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please input your email';
                                      }
                                      // Simple email validation
                                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                          .hasMatch(value)) {
                                        return 'Please enter a valid email address';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.white,
                                      ),
                                      hintText: 'Email',
                                      contentPadding: const EdgeInsets.all(12),
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    controller: value.passwordController,
                                    obscureText: value.obscureSignupPassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please input your password';
                                      }
                                      // Minimum password length validation
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters long';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_outline,
                                          color: Colors.white),
                                      hintText: 'Password',
                                      contentPadding: const EdgeInsets.all(12),
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          value.obscureSignupPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        color: Colors.white,
                                        onPressed: () {
                                          Provider.of<SignUpController>(context,
                                                  listen: false)
                                              .changeObscureVisibility();
                                        },
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Signinpage()),
                                        );
                                      },
                                      child: const Text(
                                        "Forgot Password",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 147, 75)),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 147, 75),
                                ),
                                onPressed: () async {
                                  Provider.of<SignUpController>(context,
                                          listen: false)
                                      .validateForm(context);
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()),
                                        );
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 255, 147, 75)),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
