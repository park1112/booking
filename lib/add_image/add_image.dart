import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// 이미지 피커 생성해야됨

class AddImage extends StatefulWidget {
  const AddImage(this.addImageFunc, {Key? key}) : super(key: key);

  //여기에서 이미지를 메인스크린으로 보냄
  final Function(File pickedImage) addImageFunc;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {

  File? pickedImage;

  void _pickImage() async{
    final imagePicker = ImagePicker();
    final pickedImageFile =  await imagePicker.pickImage(source: ImageSource.camera ,
    imageQuality : 50,
    maxHeight: 150
    );
    setState(() {
      if(pickedImageFile != null) {
        pickedImage = File(pickedImageFile.path);
      }
    });
  //  여기 메인스크린으로 보낼 이미지 소스 추가
    widget.addImageFunc(pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: 150,
      height: 300,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            backgroundImage: pickedImage != null ? FileImage(pickedImage!) : null,
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(onPressed: () {
            _pickImage();
          }, icon: Icon(Icons.image), label: Text('아이콘 추가')),
          SizedBox(height: 80,),
          TextButton.icon(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close), label: Text('닫기'))

        ],
      ),
    );
  }
}
