import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/notice_item.dart';

class MenuQuestionsScreen extends StatefulWidget {
  const MenuQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<MenuQuestionsScreen> createState() => _MenuQuestionsScreenState();
}

class _MenuQuestionsScreenState extends State<MenuQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '1:1 문의',
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

  getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: appBgColor,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children: List.generate(
                  questions.length,
                      (index) => Container(
                    margin: const EdgeInsets.only(left: 15,right: 15),
                    child: (NoticeItem(
                      data: questions[index],
                      isSelected: index == 0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoticeItem(
                              data: questions[index],
                              // data: populars[index],
                            ),
                          ),
                        );
                      },
                    )),
                  )))),
    );
  }
}