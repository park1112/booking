import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final _controller = TextEditingController();  //센드버튼시 메시지 삭제
  var _userEnterMessage = '';

  //새로운 메시지 생성!!
  void _sendMessage()async{
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _userEnterMessage,
      'time' : Timestamp.now(),
      'userID' : user.uid,
      'userName' : userData.data()!['username'],
      'userImage' : userData['picked_image']  //유저 이미지 가져온다 !
    });
    _controller.clear(); //센드버튼시 메시지 삭제
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller, //센드버튼시 메시지 삭제
              decoration: InputDecoration(
                labelText: '여기에 메시지를 입력해주세요.'
              ),
              onChanged: (value){
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          //유저가 메시지를 입력하지 않으면 전송버튼이 비활성화 된다.
          IconButton(onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
