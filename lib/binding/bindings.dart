import 'package:firebase_getx_auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
