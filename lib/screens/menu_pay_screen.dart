import 'package:flutter/material.dart';

import '../theme/color.dart';

class MenuPayScreen extends StatefulWidget {
  const MenuPayScreen({Key? key}) : super(key: key);

  @override
  State<MenuPayScreen> createState() => _MenuPayScreenState();
}

class _MenuPayScreenState extends State<MenuPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '결제 수단 관리',
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  getBody(){
    return Text('결제수단관리');
  }
}