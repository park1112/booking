import 'package:flutter/material.dart';
import 'package:snp_booking_app/widgets/notice_item.dart';

import '../theme/color.dart';
import '../utils/data.dart';

class MenuNoticeScreen extends StatefulWidget {
  const MenuNoticeScreen({Key? key}) : super(key: key);

  @override
  State<MenuNoticeScreen> createState() => _MenuNoticeScreenState();
}

class _MenuNoticeScreenState extends State<MenuNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '공지사항',
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
                  notice.length,
                  (index) => Container(
                        margin: const EdgeInsets.only(left: 15,right: 15),
                        child: (NoticeItem(
                          data: notice[index],
                          isSelected: index == 0,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoticeItem(
                                  data: notice[index],
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
