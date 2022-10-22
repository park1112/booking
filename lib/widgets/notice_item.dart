import 'package:flutter/material.dart';
import '../theme/color.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,

  }) : super(key: key);

  final dynamic data;
  final bool isSelected;
  final GestureTapCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return Container(
        color: appBgColor,
        child:
        Column(
          children: [
            GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['name'], style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(data['date']),
                        SizedBox(height: 5,),
                      ],
                    ),
                    Icon(Icons.dehaze_sharp , size: 12,)
                  ],
                )
            ),
            Divider(),

          ],
        )
    );
  }
}
