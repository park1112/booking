import 'package:flutter/material.dart';

class Agreement extends StatefulWidget {
  const Agreement({Key? key}) : super(key: key);

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '주문상품정보 및 결제대행 서비스 이용약관에 모두 동의 합니다.',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),
              IconButton(
                  onPressed: () => setState(() => isVisible = !isVisible),
                  icon: Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    size: 13,
                  )),
            ],
          ),
          SizedBox(height: 15,),
          if(isVisible)

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('제3자 정보제공 동의', style: TextStyle(fontSize: 12),),
                    Text('전문보기', style: TextStyle(fontSize: 10),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('서비스 이용약관', style: TextStyle(fontSize: 12),),
                    Text('전문보기', style: TextStyle(fontSize: 10),),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}
