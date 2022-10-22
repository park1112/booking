import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:snp_booking_app/theme/color.dart';
import 'package:snp_booking_app/widgets/addbtn.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: appBgColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.data["image"])),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data["name"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.data["option"][0],
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      widget.data["size"][0],
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.data["price"] + '원',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: iconBg, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      '삭제',
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                  AddBtn()
                ],
              ),
            )
            //이미지

            //글자

            //삭제 밑 버튼
          ],
        ),
      ),
    );
  }
}
