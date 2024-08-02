import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_getx_auth/login_page.dart';
import 'package:firebase_getx_auth/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

 
  var isObscure = true.obs;
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initalScreen);
  }

  _initalScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(
            email: user.email!,
          ));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About User',
        'User message',
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Account creation failed'),
        backgroundColor: Colors.redAccent,
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About Login',
        'User message',
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Login failed'),
        backgroundColor: Colors.redAccent,
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logout() async {
    await auth.signOut();
    
  }
}
