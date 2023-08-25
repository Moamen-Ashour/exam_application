import 'package:flutter_study_project/controllers/auth_controller.dart';
import 'package:flutter_study_project/widget/app_logger.dart';
import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void website() {
    _launch("https://github.com/Moamen-Ashour");
  }

  void linkedIn() {
    _launch("https://www.linkedin.com/in/moamen-ashour/");
  }

  void logout() {
    Get.find<AuthController>().logout();
  }

  void email() {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: 'info@moamen.com');
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
