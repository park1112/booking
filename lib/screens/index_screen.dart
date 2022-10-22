import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snp_booking_app/screens/login_main.dart';
import 'package:snp_booking_app/screens/login_name.dart';
import 'package:snp_booking_app/utils/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth_service.dart';
import '../kakao_login.dart';
import '../main_view_model.dart';
import '../widgets/login_btn_item.dart';

class IndexScrren extends StatefulWidget {
  const IndexScrren({Key? key}) : super(key: key);

  @override
  State<IndexScrren> createState() => _IndexScrrenState();
}

class _IndexScrrenState extends State<IndexScrren> {
  // LoginPlatform _loginPlatform = LoginPlatform.none;
  final viewModel = MainViewModel(KakaoLogin());

  // void signInWithKakao() async {
  //   try {
  //     bool isInstalled = await kakao.isKakaoTalkInstalled();
  //
  //     kakao.OAuthToken token = isInstalled
  //         ? await kakao.UserApi.instance.loginWithKakaoTalk()
  //         : await kakao.UserApi.instance.loginWithKakaoAccount();
  //
  //     final url = Uri.https('kapi.kakao.com', '/v2/user/me');
  //
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
  //       },
  //     );
  //
  //     final profileInfo = json.decode(response.body);
  //     print(profileInfo.toString());
  //
  //     setState(() {
  //       _loginPlatform = LoginPlatform.kakao;
  //     });
  //
  //   } catch (error) {
  //     print('카카오톡으로 로그인 실패 $error');
  //   }
  // }

  // void signOut() async {
  //   switch (_loginPlatform) {
  //     case LoginPlatform.facebook:
  //       break;
  //     case LoginPlatform.google:
  //       break;
  //     case LoginPlatform.kakao:
  //       await UserApi.instance.logout();
  //       break;
  //     case LoginPlatform.naver:
  //       break;
  //     case LoginPlatform.apple:
  //       break;
  //     case LoginPlatform.none:
  //       break;
  //   }
  //
  //   setState(() {
  //     _loginPlatform = LoginPlatform.none;
  //   });
  // }

  var tab = 0;

  // //구글 로그인 추가 !!
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  // //구글 로그인 추가 !!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Wrap(
                alignment: WrapAlignment.end,
                spacing: 10.0,
                runSpacing: 20.0,
                children: [
                  Center(
                      child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/images/index.png'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 400,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: LoginBtnItem(
                                data: loginBtn[0],
                                isSelected: 0 == 0,
                                onTap: () async {
                                  await viewModel.login();
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: LoginBtnItem(
                                data: loginBtn[1],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginName(
                                          // data: populars[index],
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: LoginBtnItem(
                                data: loginBtn[2],
                                onTap: () {
                                  AuthService().signInWithGoogle();
                                },
                              ),
                            ),
                            TextButton(
                                onPressed: () => Get.toNamed('/HomeScreen'),
                                child: Text('구글로그인'))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildLoginBtn(),
                    ],
                  )),
                ],
              );
            }
            return Text('로그인완료');
          }),
    );
  }

  Widget buildLoginBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('이미 가입하셨나요?'),
        const SizedBox(width: 25),
        ElevatedButton(
          onPressed: () {
            Get.to(() => LoginMain());
          },
          child: const Text('로그인'),
          style: TextButton.styleFrom(
            primary: Colors.white, // 텍스트 색 바꾸기
            backgroundColor: Colors.redAccent,
            minimumSize: const Size(70, 40),
            shape: RoundedRectangleBorder(
                //모서리를 둥글게
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.redAccent)),
            // 버튼 크기를 지정해서 바꾸기
          ),
        )
      ],
    );
  }
}
