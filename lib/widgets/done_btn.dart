import 'package:flutter/material.dart';

import '../theme/color.dart';

class DoneButten extends StatefulWidget {
  const DoneButten({Key? key, required this.data, this.onTap , this.width}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;
  final width;

  @override
  State<DoneButten> createState() => _DoneButtenState();
}

class _DoneButtenState extends State<DoneButten> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: appBgColor,

          child: Container(
            width: widget.width,
            // padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: actionColor

            ),
            child: Center(child: Text(widget.data , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14, color: Colors.white),)),
          ),

      ),
    );
  }
}
