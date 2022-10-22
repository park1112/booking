import 'package:flutter/material.dart';

import '../theme/color.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.data}) : super(key: key);
  final data;

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
                  Row(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data["image"])),
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
                          data["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          data["option"][0],
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          data["size"][0],
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              data["price"] + '원',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text('(수량 :' + '10' +'개)', style: TextStyle(fontSize: 11),)
                          ],
                        ),

                      ],
                    ),
                  ])
                ])));
  }
}
