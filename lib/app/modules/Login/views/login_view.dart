import 'package:car_enthusiast/app/modules/home/views/home_view.dart';
import 'package:car_enthusiast/app/modules/register/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  static Future<User?> loginUsingEmailPassword(
      //fungsi dibawah ini digunakan untuk autentication email yaitu membutuhkan email dan password
      // dengan type data string
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }
  // untuk controll text dalam form agar dapat memasukkan data valid 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                height: 30.0,
              ),
              Container(
                height: 200,
                child: Image.asset('assets/car.png'),
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
                  "Sign In",
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
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Get.to(() => convexbottombar(),
                            transition: Transition.zoom,
                            duration: Duration(seconds: 1));
                      }
                    },
                    child: Container(
                      height: 55,
                      child: Center(
                        child: Text(
                          'Login',
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
                      'Dont Have an Account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterView(),
                          transition: Transition.zoom,
                          duration: Duration(seconds: 1));
                    },
                    child: Center(
                      child: Text(
                        'Create Account',
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
