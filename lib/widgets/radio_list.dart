import 'package:flutter/material.dart';

class RadioList extends StatefulWidget {
  const RadioList({Key? key ,required this.data, this.count =0 }) : super(key: key);
  final data;
  final int count;



  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadioListTile(
        title: Text(widget.data, style: TextStyle(fontSize: 14),),
        value: widget.count,
        groupValue: selectedValue,
        onChanged: (value) => setState(() => selectedValue = widget.count),
      ),
    );
  }
}
