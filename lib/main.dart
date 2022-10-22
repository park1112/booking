import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:snp_booking_app/firebase_options.dart';
import 'package:snp_booking_app/screens/home_screen.dart';
import 'package:snp_booking_app/screens/index_screen.dart';
import 'package:snp_booking_app/screens/menu_pay_screen.dart';
import 'package:snp_booking_app/screens/oder_index_screen.dart';

import 'package:get/get.dart';


void main() async {
  KakaoSdk.init(nativeAppKey: '7707e4c6cac9be0b2ee5f60bf62bfb5e');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'SNP booking app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'NanumGothic',
        ),
        initialRoute: '/IndexScrren',
        // routes: {
        //   '/' : (context) => SplashScreen(), // key 값이 '/' 가 불려지면 value 값인 ScreenA()가 불려진다는 뜻이다.
        //   '/OderIndexScreen' : (context) => OderIndexScreen(),
        //   '/MenuPayScreen' : (context) => MenuPayScreen(),
        //
        //   // '/c' : (context) => ScreenC()
        // },

        getPages: [
          GetPage(name: "/OderIndexScreen", page: () => OderIndexScreen()),
          GetPage(name: "/MenuPayScreen", page: () => MenuPayScreen()),
          GetPage(name: "/HomeScreen", page: () => HomeScreen()),
          GetPage(name: "/IndexScrren", page: () => IndexScrren()),
        ],
        // home: AuthService().handleAuthState(),

        // home: StreamBuilder(  //로그아웃시 회원정보 없애준다
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot){
        //     if(snapshot.hasData){
        //       return ChatScreen();
        //     }
        //     return SplashScreen();
        // }
        //
        // ,
        //
        // )

        );
  }
}
