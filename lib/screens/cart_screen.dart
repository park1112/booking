import 'package:flutter/material.dart';
import 'package:snp_booking_app/screens/order_screen.dart';
import 'package:snp_booking_app/widgets/cart_item.dart';
import 'package:snp_booking_app/widgets/done_btn.dart';

import '../theme/color.dart';
import '../utils/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '장바구니',
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: appBgColor,
            child: Center(
                child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: appBgColor),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconBg),
                        child: Icon(
                          Icons.home_work_outlined,
                          size: 14,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '새벽유통 해운대점',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: appBgColor,
            child: Center(
                child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: appMainBg),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 12, bottom: 12, right: 0),
                child: Text(
                  '장바구니에 담으신 상품은 최대 30일간 보관됩니다.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            )),
          ),
          CartItem(
            data: mainMenu[0],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),
          Container(
            color: appBgColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '상품금액',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '3900',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '원',
                        style: TextStyle(fontSize: 9),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DoneButten(data: '주문하기', onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderScreen()));
            }),
          ),

        ],
      ),
    );
  }
}
