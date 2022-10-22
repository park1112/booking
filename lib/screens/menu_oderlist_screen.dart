import 'package:flutter/material.dart';

import '../theme/color.dart';

class MenuOderlistScreen extends StatefulWidget {
  const MenuOderlistScreen({Key? key}) : super(key: key);

  @override
  State<MenuOderlistScreen> createState() => _MenuOderlistScreenState();
}

class _MenuOderlistScreenState extends State<MenuOderlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '주문내역',
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
    return Text('주문내역');
  }
}