import 'package:flutter/material.dart';

class DeleteCode extends StatelessWidget {
  const DeleteCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              size: 30,
            ),
            label: const Text(
              "카카오톡 3초 회원가입",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
              primary: Colors.black, // 텍스트 색 바꾸기
              backgroundColor: Colors.yellowAccent,
              minimumSize: Size(350, 60),
              shape: RoundedRectangleBorder(
                //모서리를 둥글게
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.yellowAccent)),
              // 버튼 크기를 지정해서 바꾸기
            ),
          ),

        ],
      ),
    );
  }
}


