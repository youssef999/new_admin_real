// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realstateAdmin/core/resources/app_colors.dart';

PreferredSizeWidget CustomAppBar(
  String text,
  BuildContext context,
) {
  // final bottomNavBarController = Get.put(RootController(), permanent: false);

  return AppBar(
    backgroundColor: AppColors.whiteColor,
    // elevation: bottomNavBarController.selectedIndex.value == 0 ? 0 : 0,
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back)),
    title: Padding(
      padding: const EdgeInsets.all(24 * 1.2),
      child: Text(
        text,
        style: GoogleFonts.cairo(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryBGLightColor,
        ),
      ),
    ),
   
  );
}
