import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:janadem/constants/assets.dart';
import 'package:janadem/screens/auth/login/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initServer();
  }

  Future<void> initServer() async{
    Future.delayed(const Duration(seconds: 2), (){
      Get.offAll(
          () => const LoginScreen()
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff056C5F),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('${Assets().img}logo_white.svg'),
              SizedBox(height: 1.h),
              Text(
                'JANADEM',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 23.sp,
                  color: Colors.white,
                  letterSpacing: 10.sp
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
