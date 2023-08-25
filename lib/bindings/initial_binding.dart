import 'package:flutter_study_project/controllers/auth_controller.dart';
import 'package:flutter_study_project/controllers/theme_controller.dart';
import 'package:flutter_study_project/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
    /*   Get.lazyPut(() => FirebaseStorageService()); */
  }
}
