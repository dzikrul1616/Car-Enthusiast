import 'package:car_enthusiast/app/modules/Login/views/login_view.dart';
import 'package:car_enthusiast/app/modules/home/views/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg1.png'),
                fit: BoxFit.cover,
                opacity: 10,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
              child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 80.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Car Enthusiast",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'KanitEB',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " .",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'KanitEB',
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'KanitEB',
                    color: Color(0xff19DE21),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Pading agar text dipersempit secara simetris kiri dan kanan sejauh 35px horizontal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Color.fromARGB(71, 255, 255, 255),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    // labelText: 'Masukkan Username',
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontFamily: 'Kanit',
                      color: Color.fromARGB(173, 255, 255, 255),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Pading agar text dipersempit secara simetris kiri dan kanan sejauh 35px horizontal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: TextFormField(
                  controller: phonenumberController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Color.fromARGB(71, 255, 255, 255),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    // labelText: 'Masukkan Username',
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontFamily: 'Kanit',
                      color: Color.fromARGB(173, 255, 255, 255),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Color.fromARGB(71, 255, 255, 255),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    // labelText: 'Masukkan Email',
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Kanit',
                      color: Color.fromARGB(173, 255, 255, 255),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Color.fromARGB(71, 255, 255, 255),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(173, 255, 255, 255),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                    onPressed: () {
                      users.add({
                        'username': usernameController.text,
                        'phone': int.tryParse(phonenumberController.text) ?? 0
                      });

                      usernameController.text = '';
                      phonenumberController.text = '';
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(value.user!.uid)
                            .set({"email": value.user!.email});

                        Get.to(() => convexbottombar(),
                            transition: Transition.zoom,
                            duration: Duration(seconds: 1));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    },
                    child: Container(
                      height: 55,
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontFamily: 'KanitEB', fontSize: 18),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff19DE21),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Have an Account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginView(),
                          transition: Transition.zoom,
                          duration: Duration(seconds: 1));
                    },
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xff19DE21),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
