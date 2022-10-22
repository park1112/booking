import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/palette.dart';

class LoginCertification extends StatelessWidget {
  const LoginCertification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          NameText(),
          SizedBox(
            height: 10,
          ),
          Center(child: NameField()),
          SizedBox(
            height: 5,
          ),
          Center(child: NextButton()),
          SizedBox(
            height: 5,
          ),
          Center(child: buildLoginBtn())
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        TextButton(
          onPressed: () {},
          child: Text("인증번호가 오지 않나요?"),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            // Get.to(() => LoginMain());},
          },
          child: const Text('휴대전화번호 변경'),
          style: TextButton.styleFrom(
            primary: Colors.white, // 텍스트 색 바꾸기
            backgroundColor: Colors.grey,
            minimumSize: const Size(70, 40),
            shape: RoundedRectangleBorder(
                //모서리를 둥글게
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.grey)),
            // 버튼 크기를 지정해서 바꾸기
          ),
        )
      ],
    );
  }
}

class NameText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // padding: EdgeInsets.only(left: 20),
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '문자로 인증번호가 발송 되었습니다. ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '3분 이내에 입력해 주세요.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      child: TextField(
        onChanged: (e) {},
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle,
              color: Palette.iconColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            hintText: '6자리 숫자 입력',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Palette.textColor1,
            ),
            contentPadding: EdgeInsets.all(5) //동그라미 줄이기

            ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey,
          minimumSize: Size(410, 55),
          shape: RoundedRectangleBorder(
              //모서리를 둥글게
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey)),
        ),
        onPressed: () => Get.to(LoginCertification()),
        child: const Text(
          '다음',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
