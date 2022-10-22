import 'package:flutter/material.dart';

class AddBtn extends StatefulWidget {
  const AddBtn({Key? key}) : super(key: key);

  @override
  State<AddBtn> createState() => _AddBtnState();
}

class _AddBtnState extends State<AddBtn> {
  int currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () => setState(() {
                currentValue <= 1 ? currentValue == 1 : currentValue--;
              }),
              icon: Icon(
                Icons.remove,
                size: 14,
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            currentValue.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () => setState(() {
                currentValue++;
              }),
              icon: Icon(
                Icons.add,
                size: 14,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
