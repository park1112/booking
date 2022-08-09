import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('채팅방'),
          actions: [
            IconButton(
                onPressed: () {
                  _authentication.signOut();
                  // Navigator.pop(context);
                },
                icon: Icon(
                  Icons.exit_to_app_sharp,
                  color: Colors.white,
                ))
          ],
        ),
        body: StreamBuilder(  //파이어베이스 데이터 가져오기
          stream: FirebaseFirestore.instance
              .collection('chats/XsjnRJMpVQCesQjoCduw/message')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(), //원형 진행 표시기 : 서큘러 프로그레스 인디케이터
              );
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Text(docs[index]['text'],
                    style: TextStyle(fontSize: 20.0),),
                  );
                });
          },
        ));
  }
}
