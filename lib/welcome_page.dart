import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key, required this.email});
  String email;
  AuthController authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    double sceenWidth = MediaQuery.of(context).size.width;
    double sceenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: sceenWidth,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                authCtrl.logout();
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
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
