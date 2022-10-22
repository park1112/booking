import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snp_booking_app/widgets/custom_image.dart';
import 'package:snp_booking_app/widgets/icon_box.dart';
import '../theme/color.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBtnItem extends StatelessWidget {
  const LoginBtnItem({
    Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,
    this.padding = const EdgeInsets.fromLTRB(20, 15, 20, 15),
  }) : super(key: key);
  final dynamic data;
  final bool isSelected;
  final GestureTapCallback? onTap;
  final EdgeInsets padding;

  //구글 로그인 추가 !!
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  //구글 로그인 추가 !!

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
              color: isSelected ? primary : cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.07),
                  spreadRadius: .5,
                  blurRadius: .5,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 34,
                  height: 34,
                  child: IconBox(
                    child: SvgPicture.asset(data["icon"]),
                    radius: 15,
                    bgColor: appBgColor,
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),
                Text(
                  data["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? textColor : darker,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
