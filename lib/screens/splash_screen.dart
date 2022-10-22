
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snp_booking_app/auth_service.dart';
import 'package:snp_booking_app/screens/cart_screen.dart';
import 'package:snp_booking_app/screens/home_screen.dart';
import 'package:snp_booking_app/screens/index_screen.dart';
import 'package:snp_booking_app/screens/order_screen.dart';

import 'list_sereen.dart';
import 'login_platform.dart';
import 'main_screen.dart';
import 'oder_index_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      moveScreen();
    });
  }



  void moveScreen() {
    if (widget.isLogin) {
      Get.toNamed("/HomeScreen");
    } else {
      Get.toNamed("/IndexScrren");
    }
  }



  // //로그인 확인
  // void moveScreen() async {
  //   await checkLogin().then((isLogin) {
  //     if (isLogin) {
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => HomeScreen()));
  //     } else {
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => IndexScrren()));
  //     }
  //   });
  // }
  //
  // Future<bool> checkLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLogin = prefs.getBool('isLogin') ?? false;
  //   print("[*] isLogin : " + isLogin.toString());
  //   return isLogin;
  // }
  // //로그인 확인

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '새벽 ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
              Text(
                ' 유통',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}
