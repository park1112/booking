import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snp_booking_app/screens/main_screen.dart';
import 'firebase_options.dart';


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
      home: const LoginSignupScreen(),
    );
  }
}
