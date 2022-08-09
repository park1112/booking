import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snp_booking_app/screens/chat_screen.dart';
import 'package:snp_booking_app/screens/main_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
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
    return MaterialApp(
      title: 'SNP booking app',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: StreamBuilder(  //로그아웃시 회원정보 없애준다
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ChatScreen();
          }
          return LoginSignupScreen();
        },
      )
    );
  }
}
