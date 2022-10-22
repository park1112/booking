import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:snp_booking_app/screens/menu_address_screen.dart';
import 'package:snp_booking_app/screens/cart_screen.dart';
import 'package:snp_booking_app/screens/item_detail.dart';
import 'package:snp_booking_app/screens/menu_notice_screen.dart';
import 'package:snp_booking_app/screens/menu_oderlist_screen.dart';
import 'package:snp_booking_app/screens/menu_pay_screen.dart';
import 'package:snp_booking_app/screens/menu_questions_screen.dart';
import 'package:snp_booking_app/screens/oder_index_screen.dart';
import 'package:snp_booking_app/screens/order_screen.dart';
import 'package:snp_booking_app/widgets/main_btn_icon.dart';
import 'package:snp_booking_app/utils/data.dart';
import 'package:snp_booking_app/widgets/menu_item.dart';

import '../model/main_model.dart';
import '../theme/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const List<String> imgList = [
  'https://cdn.pixabay.com/photo/2022/09/11/14/52/bee-7446944_1280.jpg',
  'https://cdn.pixabay.com/photo/2022/01/28/10/11/lake-6974251_1280.jpg',
  'https://cdn.pixabay.com/photo/2022/08/03/08/11/little-boom-7362108_1280.jpg'
];

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference product = FirebaseFirestore.instance.collection('mainItem');


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          title: Text(
            '새벽유통',
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          backgroundColor: appBarColor,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
              builder: (context) => IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  )),
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
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              // padding: EdgeInsets.only(
              //   top: MediaQuery.of(context).padding.top
              // ),
              padding: EdgeInsets.all(25),
              children: <Widget>[
                // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
                // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    onDetailsPressed: () {},
                    accountName: Text(
                      '박현재',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    accountEmail: Text(
                      '010-5334-4722',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),

                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('주소관리'),
                  onTap: () {
                    // Navigator.pop(context);
                    // 이게 있으면 뒤로가기 버튼이 생김 !
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddressSearchScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.dehaze,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('구매내역'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MenuOderlistScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.call_to_action,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('결제 수단 관리'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MenuPayScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_fire_department,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('공지사항'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MenuNoticeScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.quora,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('문의사항'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MenuQuestionsScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('Q&A'),
                  onTap: () {
                    print('Q&A is clicked');
                  },
                  // trailing: Icon(Icons.add),
                ),
                const Divider(
                  height: 1,
                  color: appMainBg,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey[850],
                    size: 20,
                  ),
                  title: Text('새벽유통 파트너 지원'),
                  subtitle: Text(
                    '판매 전문가라면 새벽유통 파트너로 활동해 보세요.',
                    style: TextStyle(fontSize: 13),
                  ),
                  onTap: () {
                    print('Setting is clicked');
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: appMainBg,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImgSwiper(),
                SizedBox(
                  height: 10,
                ),
                TextName(),
                SizedBox(
                  height: 10,
                ),
                PointBox(),
                SizedBox(
                  height: 10,
                ),
                RecommendedMenu(),
              ],
            ),
          ),
        ));
  }

  Stream<List<MainModel>> streamMain() {
    try {
      //찾고자 하는 컬렉션의 스냅샷(Stream)을 가져온다.
      final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
          .collection('itemList/LJXeYmB6NsTfTQxcm7ot/mainList')
          .snapshots();

      //새낭 스냅샷(Stream)내부의 자료들을 List<MessageModel> 로 변환하기 위해 map을 사용하도록 한다.
      //참고로 List.map()도 List 안의 element들을 원하는 형태로 변환하여 새로운 List로 반환한다
      return snapshots.map((querySnapshot) {
        List<MainModel> mainList =
            []; //querySnapshot을 message로 옮기기 위해 List<MessageModel> 선언
        querySnapshot.docs.forEach((element) {
          //해당 컬렉션에 존재하는 모든 docs를 순회하며 messages 에 데이터를 추가한다.
          mainList.add(MainModel.fromMap(
            id: element.id,
            map: element.data() as Map<String, dynamic>,
          ));
        });
        return mainList; //QuerySnapshot에서 List<MessageModel> 로 변경이 됐으니 반환
      }); //Stream<QuerySnapshot> 에서 Stream<List<MessageModel>>로 변경되어 반환됨

    } catch (ex) {
      //오류 발생 처리
      log('error)', error: ex.toString(), stackTrace: StackTrace.current);
      return Stream.error(ex.toString());
    }
  }

  Widget ImgSwiper() {
    return Container(
      color: appBgColor,
      height: 250,
      // width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Swiper(
          autoplay: true,
          // control:new SwiperControl(), 컨트롤러 생성
          pagination: SwiperPagination(alignment: Alignment.bottomCenter),
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              imgList[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }

  Widget TextName() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        alignment: Alignment(-1.0, -1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '박현재 님',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '환영합니다.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget PointBox() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: pointBg,
            borderRadius: BorderRadius.circular(20),
          ),
          // padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('내 포인트 0점', style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text('최근이용상품없음',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      // color: Colors.brown,
                      decoration: BoxDecoration(
                        color: iconBg,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: iconbg, width: 2)
                      ),

                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          Text('새벽유통 GO',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // 모아보기 위치
              Container(
                  // padding: EdgeInsets.all(-10),
                  decoration: BoxDecoration(
                    color: appBgColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: appBgColor, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.07),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '모아보기',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Wrap(
                                    // direction: Axis.vertical,
                                    // 정렬 방향
                                    alignment: WrapAlignment.start,
                                    // 정렬 방식
                                    spacing: 10,
                                    // 상하(좌우) 공간
                                    runSpacing: 10,
                                    // 좌우(상하) 공간

                                    children: List.generate(
                                      mainAllBtn.length,
                                      (index) => Container(
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: MainBtnIcon(
                                          data: mainAllBtn[index],
                                          isSelected: index == 0,
                                          onTap: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => mainAllBtn[index]['url']
                                            //         // data: populars[index],
                                            //
                                            //   ),
                                            // );
                                            // print(mainAllBtn[index]['url']);
                                            Get.toNamed(
                                                mainAllBtn[index]['url']);
                                          },
                                        ),
                                        //아이콘들 생성
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ]),
                  ))
              //모아보기 끝
            ],
          )),
    );
  }

  Widget RecommendedMenu() {
    return
    // StreamBuilder<List<MainModel>>(
      StreamBuilder(
        stream: product.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (!streamSnapshot.hasData) {
            //데이터가 없을 경우 로딩위젯을 표시한다.
            return const Center(child: CircularProgressIndicator());
          } else if (streamSnapshot.hasError) {
            return const Center(
              child: Text('오류가 발생했습니다.'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                // Text(mainList[0].price),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '이달의 추천 메뉴',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '더보기',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appBgColor),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Wrap(
                              // direction: Axis.vertical,
                              // 정렬 방향
                              alignment: WrapAlignment.start,
                              // 정렬 방식
                              spacing: 10,
                              // 상하(좌우) 공간
                              runSpacing: 10,
                              // 좌우(상하) 공간
                              children: List.generate(
                                streamSnapshot.data!.docs.length,
                                (index) => Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: MainMenuItem(
                                    data: streamSnapshot.data!.docs[index],
                                    isSelected: index == 0,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ItemDetail(
                                            data: streamSnapshot.data!.docs[index].toString(),
                                            // data: populars[index],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  //아이콘들 생성
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );

          }
        });
  }

// Widget Drawer() {
//   return ListView(
//     padding: EdgeInsets.zero,
//     children: [
//       DrawerHeader(child: Text('해더부분')),
//       ListTile(
//         title: Text('첫메뉴'),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: Text('첫메뉴'),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       )
//     ],
//   );
// }
}
