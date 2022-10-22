import 'package:flutter/material.dart';
import 'package:snp_booking_app/screens/cart_screen.dart';
import 'package:snp_booking_app/widgets/gridview_screen.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/category_item.dart';
import '../widgets/menu_item.dart';
import 'item_detail.dart';

class OderIndexScreen extends StatefulWidget {
  const OderIndexScreen({Key? key}) : super(key: key);

  @override
  State<OderIndexScreen> createState() => _OderIndexScreenState();
}

class _OderIndexScreenState extends State<OderIndexScreen> {
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
    );
  }

  getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
                  child: SizedBox(height: 10),
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 0),
            decoration: BoxDecoration(color: appBgColor),
            child: listCategories(),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: appBgColor),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GridView.count(
                  shrinkWrap: true,   //이걸 안넣으면 높이가 얼마나 있는지 몰라서 오류 발생함
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    mainMenu.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(15),
                      child: MainMenuItem(
                        data: mainMenu[index],
                        isSelected: index == 0,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetail(
                                data: mainMenu[index],
                                // data: populars[index],
                              ),
                            ),
                          );
                        },
                      ),
                      //아이콘들 생성
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  listCategories() {
    List<Widget> lists = List.generate(foodCategories.length,
        (index) => CategoryItem(data: foodCategories[index]));
    lists.insert(
        0,
        CategoryItem(
          data: {"name": "All", "icon": "assets/icons/logo/googlelogo.svg"},
          seleted: true,
        ));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}
