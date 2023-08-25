import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_project/configs/themes/app_colors.dart';
import 'package:flutter_study_project/configs/themes/ui_parameters.dart';
import 'package:flutter_study_project/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 47, 143, 18),
      ),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: onSurfaceTextColor,
            ),
          ),
        ),
        child: SafeArea(
            child: Stack(
          children: [
            /*  Positioned(
              right: 0,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  controller.toogleDrawer();
                },
              ),
            ), */
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => controller.user.value == null
                        ? SizedBox()
                        : Text(
                            "Hi ${controller.user.value?.displayName}" ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: onSurfaceTextColor),
                          ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  _DrawerButton(
                    icon: Icons.web,
                    label: "Website",
                    onPressed: () => controller.website(),
                  ),
                  _DrawerButton(
                    icon: Icons.facebook,
                    label: "Facebook",
                    onPressed: () => controller.linkedIn(),
                  ),
                  _DrawerButton(
                    icon: Icons.email,
                    label: "email",
                    onPressed: () => controller.email(),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  _DrawerButton(
                    icon: Icons.logout,
                    label: "Logout",
                    onPressed: () => controller.logout(),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
