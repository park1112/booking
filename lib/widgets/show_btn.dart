import 'package:flutter/material.dart';
import 'package:snp_booking_app/widgets/radio_list.dart';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';

import '../utils/data.dart';

class ShowBtn extends StatefulWidget {
  const ShowBtn({Key? key, required this.data, this.option}) : super(key: key);
  final data;
  final option;

  @override
  State<ShowBtn> createState() => _ShowBtnState();
}

class _ShowBtnState extends State<ShowBtn> {
  bool isVisible = true;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.data,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () => setState(() => isVisible = !isVisible),
                icon: Icon(
                  Icons.keyboard_double_arrow_down_sharp,
                  size: 13,
                )),
          ],
        ),
        if (isVisible)
        //   RadioListTile(
        //     title: Text('특'),
        //     value: 0,
        //     groupValue: selectedValue,
        //     onChanged: (value) => setState(() => selectedValue = 0),
        //   ),
        // RadioListTile(
        //   title: Text('대'),
        //   value: 1,
        //   groupValue: selectedValue,
        //   onChanged: (value) => setState(() => selectedValue = 1),
        // )
          Column(
            children: [

              RadioGroup(
                  radioList: widget.option,
                  selectedItem: 0,
                  textSize: 14,
                  onChanged: (value) {

                  },
                  disabled: false),


            ],
          )
      ],
    );
  }
}
