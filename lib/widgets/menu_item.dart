import 'package:flutter/material.dart';
import '../theme/color.dart';

class MainMenuItem extends StatelessWidget {
  const MainMenuItem({Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,
    this.padding = const EdgeInsets.all(5),}) : super(key: key);
  final dynamic data;
  final bool isSelected;
  final GestureTapCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appBgColor,
          borderRadius: BorderRadius.circular(20),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                Container(
                  height: 120, width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(data["image"])
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(data["name"], style: TextStyle(fontSize: 13),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data["price"] , style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text('원',style: TextStyle(fontSize: 12),)
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: red, width: 2)
                  ),
                  child: Text("NEW",style: TextStyle(fontSize: 10, color: red),),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}
