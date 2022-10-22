import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

import '../theme/color.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({Key? key}) : super(key: key);

  @override
  State<AddressSearchScreen> createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  String postCode = '-';
  String roadAddress = '-';
  String jibunAddress = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '주소 관리',
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      KpostalView(
                        useLocalServer: true,
                        localPort: 1024,
                        // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                        callback: (Kpostal result) {
                          setState(() {
                            this.postCode = result.postCode;
                            this.roadAddress = result.address;
                            this.jibunAddress = result.jibunAddress;
                            this.latitude = result.latitude.toString();
                            this.longitude = result.longitude.toString();
                            this.kakaoLatitude =
                                result.kakaoLatitude.toString();
                            this.kakaoLongitude =
                                result.kakaoLongitude.toString();
                          });
                        },
                      ),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue)),
            child: Text(
              'Search Address',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text('postCode',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('result: ${this.postCode}'),
                Text('road_address',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('result: ${this.roadAddress}'),
                Text('jibun_address',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('result: ${this.jibunAddress}'),
                Text('LatLng', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    'latitude: ${this.latitude} / longitude: ${this
                        .longitude}'),
                Text('through KAKAO Geocoder',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    'latitude: ${this.kakaoLatitude} / longitude: ${this
                        .kakaoLongitude}'),
              ],
            ),
          ),
        ],
      ),
    );


  }
}
