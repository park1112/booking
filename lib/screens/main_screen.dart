import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:snp_booking_app/add_image/add_image.dart';
import 'package:snp_booking_app/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart'; //파이어베이스 회원가입 로그인
import 'package:snp_booking_app/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; //로그인 로딩창 생성 코딩쉐프 매운맛 25강 23분
import 'package:cloud_firestore/cloud_firestore.dart'; //회원정보 저장기능!!
// import '파이어베이스스토리지 임포트해야됨!';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _authentication = FirebaseAuth.instance;
  bool isSignupScreen = true;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassWord = '';

  //여기 add_image에서 받아온것을 저장한다 !
  File? userPickedImage;

  void pickedImage(File image) {
    userPickedImage = image;
  }

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  //이미지 다이얼로그 생성!!
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            child: AddImage(pickedImage)
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner, //로그인시 로딩창 생성
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/2.jpg'), fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 30, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'SNP PLUS 입니다.' ,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: isSignupScreen ? '환영합니다.' : '로그인',
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '에스엔피 쇼핑몰 입니다.',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //배경
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: 180,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  padding: EdgeInsets.all(20.0),
                  height: isSignupScreen ? 280.0 : 250.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  //이거 현재의 위치에서 -40만큼 줄여줌
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  //좌우 여백 20씩 줌
                  decoration: BoxDecoration(
                    //흰색 박스만듬 !
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                        )
                      ]),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    '로그인',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1,
                                    ),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '가입하기',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSignupScreen
                                              ? Palette.activeColor
                                              : Palette.textColor1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      //이미지 추가 버튼 생성
                                      if(isSignupScreen)
                                        GestureDetector(
                                          onTap: () {
                                            showAlert(context);
                                          },
                                          child: Icon(
                                            Icons.image,
                                            color: isSignupScreen
                                                ? Colors.cyan
                                                : Colors.grey[300],
                                          ),
                                        )
                                    ],
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 3, 35, 0),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: ValueKey(1),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 2) {
                                        return '닉네임은 2글자 이상입니다.';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userName = value!;
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: '등록할 닉네임을 입력해주세요.',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding:
                                        EdgeInsets.all(10) //동그라미 줄이기

                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: ValueKey(2),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return '이메일의 형식이 아닙니다.';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userEmail = value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: 'User Id를 입력해주세요.',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding:
                                        EdgeInsets.all(10) //동그라미 줄이기

                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    key: ValueKey(3),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return '비밀번호는 6자리 이상이여야 합니다.';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userPassWord = value!;
                                    },
                                    onChanged: (value) {
                                      userPassWord = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: 'User 비밀번호를 입력해주세요.',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding:
                                        EdgeInsets.all(10) //동그라미 줄이기

                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (!isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: ValueKey(4),
                                    validator: (value) {
                                      //검증하다 벨리데이터
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        //컨테인스 포함하다
                                        return '이메일의 형식이 아닙니다.';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userEmail = value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: '로그인 Id를 입력해주세요.',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding:
                                        EdgeInsets.all(10) //동그라미 줄이기

                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    key: ValueKey(5),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return '비밀번호는 6자리 이상이여야 합니다.';
                                      }
                                      ;
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userPassWord = value!;
                                    },
                                    onChanged: (value) {
                                      userPassWord = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0))),
                                        hintText: '로그인 비밀번호를 입력해주세요.',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Palette.textColor1,
                                        ),
                                        contentPadding:
                                        EdgeInsets.all(10) //동그라미 줄이기

                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              //텍스트 폼 필드
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen ? 430 : 390,
                right: 0,
                left: 0,
                child: Center(
                  child: GestureDetector(
                    //제스쳐 딕텐터
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      //전송버튼 누르면 실행됨!
                      if (isSignupScreen) {
                        if (userPickedImage == null) {
                          setState(() {
                            showSpinner = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('이미지를 선택하여 주세요.'),
                              backgroundColor: Colors.blue,
                            ),
                          );
                          return;
                        }
                        _tryValidation();
                        try {
                          final newUser = await _authentication
                              .createUserWithEmailAndPassword(
                              email: userEmail, password: userPassWord);
                          // 파이어베이스 회원가입시 users 컬랙션에 회원정보 저장하기

                          //여기는 이미지 추가하기
                          final refImage = FirebaseStorage.instance.ref()
                              .child('picked_image')
                              .child(newUser.user!.uid + 'png');

                          await refImage.putFile(userPickedImage!);
                          //url정보 변환하기 !
                          final url = await refImage.getDownloadURL();

                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(newUser.user!.uid)
                              .set({
                            'userName': userName,
                            'email': userEmail,
                            'userUid': newUser.user!.uid,
                            'picked_image' : url ,
                          });
                          if (newUser.user != null) {
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) {
                            //       return ChatScreen(); //채팅방으로 이동하게 만든다 .
                            //     }),
                            // );
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('이메일 또는 비밀번호를 확인해주세요.'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }
                      }
                      if (!isSignupScreen) {
                        _tryValidation();
                        try {
                          final newUser =
                          await _authentication.signInWithEmailAndPassword(
                              email: userEmail, password: userPassWord);
                          if (newUser.user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ChatScreen(); //채팅방으로 이동하게 만든다 .
                              }),
                            );
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.orange, Colors.red],
                                begin: Alignment.topLeft,
                                //그라데이션 위치
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              )
                            ]),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //전송버튼
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen
                    ? MediaQuery
                    .of(context)
                    .size
                    .height - 125
                    : MediaQuery
                    .of(context)
                    .size
                    .height - 165,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(isSignupScreen ? '회원가입 with' : '로그인 with'),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(155, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Palette.googleColor),
                      icon: Icon(Icons.add),
                      label: Text('Google'),
                    ),
                  ],
                ),
              )
              //구글 로그인 버튼
            ],
          ),
        ),
      ),
    );
  }
}
