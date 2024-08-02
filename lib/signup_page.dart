import 'dart:ffi';

import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:firebase_getx_auth/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  AuthController authCtrl = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
     var emailController = TextEditingController();
  var passwordController = TextEditingController();
    double sceenWidth = MediaQuery.of(context).size.width;
    double sceenHeight = MediaQuery.of(context).size.height;
   
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: sceenWidth,
                height: sceenHeight * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/loginbutton.jpg',
                      ),
                      fit: BoxFit.cover),
                ),
                child: SizedBox(
                  height: sceenHeight * 0.2,
                  child: Image.asset('assets/images/person.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: sceenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ]),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Color.fromARGB(255, 218, 91, 243),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ]),
                      child: Obx(
                        () => TextField(
                          controller: passwordController,
                          obscureText: authCtrl.isObscure.value,
                          decoration: InputDecoration(
                            suffixIcon: Obx(
                              () => GestureDetector(
                                onTap: () => authCtrl.isObscure.value =
                                    !authCtrl.isObscure.value,
                                child: Icon(authCtrl.isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.vpn_key_sharp,
                              color: Color.fromARGB(255, 218, 91, 243),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  authCtrl.register(emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Container(
                  width: sceenWidth * 0.5,
                  height: sceenHeight * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/loginbutton.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sceenWidth * 0.2,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign in',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => LoginPage()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
