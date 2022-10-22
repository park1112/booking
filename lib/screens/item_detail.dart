import 'package:flutter/material.dart';
import 'package:snp_booking_app/screens/cart_screen.dart';
import 'package:snp_booking_app/theme/color.dart';
import 'package:snp_booking_app/widgets/addbtn.dart';
import 'package:snp_booking_app/widgets/custom_boutton.dart';
import 'package:snp_booking_app/widgets/show_btn.dart';

import '../utils/data.dart';
import '../widgets/done_btn.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '메뉴상세',
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              })
        ],
      ),
      body: getBody(),
      floatingActionButton: getActionButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  getBody() {
    // 여기서 안됨! !!!!!!
    print('widget.data["option"]');
    var option = widget.data["option"];
    var size = widget.data["size"];
    print(widget.data["name"]);
    print(option.toString());

    // List<String> option = widget.data["option"];
    // List<String> size = widget.data["size"];
    // List<dynamic> option = widget.data["option"];
    // List<dynamic> size = widget.data["size"];
    // Map<String?,dynamic> option = widget.data["option"];
    // Map<String?,dynamic> size = widget.data["size"];
    return SingleChildScrollView(

        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: appBgColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.data["image"])),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.data["name"],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ShowBtn(
                          data: '크기 옵션을 선택해 주세요.',
                          option: option),
                      SizedBox(
                        height: 20,
                      ),
                      ShowBtn(
                          data: '무게 옵션을 선택해 주세요.', option: size),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(color: appMainBg),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data["price"] + '원',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  AddBtn()
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(color: appMainBg),
              ),
            ),
          ],
        ));
  }

  getActionButton() {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '주문금액',
                        style: TextStyle(fontSize: 12, color: inActiveColor),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '4000',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: actionColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '원',
                            style: TextStyle(fontSize: 12, color: actionColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DoneButten(
                          data: '장바구니',
                          width: MediaQuery.of(context).size.width / 2 - 40 ,
                        ),

                        DoneButten(
                            data: '주문하기',
                            width: MediaQuery.of(context).size.width / 2 - 40
                          )
                      ],
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
