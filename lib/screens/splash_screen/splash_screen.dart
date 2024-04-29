import 'package:chat_app/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/screens/login_screen/login_screen.dart';
import 'package:chat_app/utils/images/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const ChatScreen()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LogInScreen()), (route) => false);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.friend,
                width: 190.w, height: 190.w, fit: BoxFit.cover),
            Text(
              "Friend app",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppImages.fontPoppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 50.sp),
            ),
          ],
        )));
  }
}
