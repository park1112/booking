import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snp_booking_app/theme/color.dart';
import 'package:snp_booking_app/widgets/icon_box.dart';

class MainBtnIcon extends StatelessWidget {
  const MainBtnIcon({Key? key,
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
    return Column(
      children: [
      GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          padding: padding,
          decoration: BoxDecoration(
            color: isSelected ? pointBg : appBgColor,
            border: Border.all(color: isSelected? pointBg : iconBgLine, width: 1),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.07),
                spreadRadius: .5,
                blurRadius: .5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child : Column(
            children: [
              SizedBox(
                width: 34,
                height: 34,
                child: IconBox(
                  child: SvgPicture.asset(data["icon"]),
                  // radius: 15,
                  isShadow : false,
                  bgColor: appBgColor,
                ),
              ),

            ],
          ),

          ),
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     color: pointBg,
      //     borderRadius: BorderRadius.circular(10)
      //   ),
      //   child: Icon(Icons.abc, color: Colors.white,),
      // )
        const SizedBox(height: 5,),
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            color: darker,
            // fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
