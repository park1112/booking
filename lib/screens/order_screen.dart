import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'package:flutter/material.dart';
import 'package:snp_booking_app/widgets/agreement.dart';
import 'package:snp_booking_app/widgets/order_item.dart';
import 'package:snp_booking_app/widgets/radio_list.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/cart_item.dart';
import '../widgets/done_btn.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '주문하기',
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 25,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),
          OrderItem(
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
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '요청사항',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(ex. 문앞에 두고 가세요.)',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: '요청사항이 있으면 적어주세요.',
                      hintStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: appMainBg,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: appMainBg))),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '포인트 적용',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '잔여 포인트',
                          style: TextStyle(fontSize: 10, color: primary),
                        ),
                        Text(
                          '0점',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: primary),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '요청사항이 있으면 적어주세요.',
                                hintStyle: TextStyle(fontSize: 12),
                                contentPadding: EdgeInsets.all(10),
                                filled: true,
                                fillColor: appMainBg,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: appMainBg))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('원'),
                      ],
                    ),
                    Container(
                      color: appBgColor,
                      child: Container(
                        width: 100,
                        // padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: iconBg),
                        child: Center(
                            child: Text(
                          '사용',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 12,
                      color: labelColor,
                    ),
                    Text(
                      '100P 이상 보유시 1P 단위로 사용하실 수 있습니다.',
                      style: TextStyle(fontSize: 10, color: labelColor),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '결제수단',
                  style:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                RadioList(data: '신용카드'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: RadioList(data: '선불카드 - 잔액 0원'),
                    width: 300,),
                    Container(
                      child: Text('카드 충전', style: TextStyle(fontSize: 10, color:primary ),),
                      padding: EdgeInsets.only(left: 8,top: 4,bottom: 4, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: red, width: 1)
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '상품금액',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '4000',
                          style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '원',
                          style:
                          TextStyle(fontSize: 12,),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '할인금액',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-0',
                          style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '원',
                          style:
                          TextStyle(fontSize: 12,),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '결제금액',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '4000',
                          style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primary),
                        ),
                        Text(
                          '원',
                          style:
                          TextStyle(fontSize: 12,),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),



          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: appMainBg),
            ),
          ),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Agreement()),
          DoneButten(
            data: '주문하기',
          )
        ],
      ),
    );
  }
}
