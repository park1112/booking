import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snp_booking_app/chatting/chat/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        //여기에 챗값을 가져옴 !
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true) //시간순으로 정렬하게 만듬 이거 삭제해도됨!
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //만약 스냅샷스테이트가 기다릴때 로딩페이지 보여주게 한다 .
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDocs = snapshot.data!.docs;
          return ListView.builder(
            reverse: true, //메시지 밑에서부터 생성됨 !!
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              return ChatBubbles(
                  chatDocs[index].data()['text'],
                  chatDocs[index].data()['userName'].toString(),
                  chatDocs[index].data()['userID'].toString() == user!.uid,
                  chatDocs[index].data()['userImage']
              );
            },
          );
        });
  }
}
