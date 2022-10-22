import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    // return Container(
      // 아래창고 2창고 하고 15000개 여기
      // 물래방아 2창고 2줄 28000
      // 24,000
    return new GridView.count(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
          children: List.generate(11, (index) {  //item 의 반목문 항목 형성
            return Container(
              color: Colors.lightGreen,
              child: Text(' Item : $index'),
            );
          }),
    );
  }
}