import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_getx_auth/binding/bindings.dart';
import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:firebase_getx_auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => Get.put(AuthController()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const  SplashScreen(),
      initialBinding: HomeBindings(),
    );
  }
}
