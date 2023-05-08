import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kta/pages/onboarding_page.dart';
import 'package:kta/pages/PhoneInputPage.dart';
import 'package:http/http.dart' as http;
import 'package:kta/shared/theme.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/LS.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final url = "http://localhost:8000/api";
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  var a = LS();
  // var storage = new FlutterSecureStorage();
  @override
  void initState() {
    super.initState();

    reloadToken();
  }

  void reloadToken() async {
    a.write(key: "aa", value: "weuw");
    print(await a.read(key: "aa"));
  }

  Future<void> postData() async {
    final ulink = Uri.parse('$url/login');
    final headers = {
      "Content-type": "application/x-www-form-urlencoded"
      //   "Authorization":
      //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjgzMjUxODk5LCJleHAiOjE2ODMzMzgyOTksIm5iZiI6MTY4MzI1MTg5OSwianRpIjoicnZlTU5lYUp2N1oyYjlRdCIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.drKPtkiPwWLChAAnQzgSXMmU99zSGkXsZObo-c6SPH4"
      //
    };
    final json = {
      'email': emailcontroller.text,
      'password': passwordcontroller.text
    };

    final response = await http.post(ulink, headers: headers, body: json);
    var jsonResponse = jsonDecode(response.body);

    // if (response.statusCode == 200) {
    //   await storage.write(key: 'token', value: jsonResponse['access_token']);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const LoginPage(),
    //     ),
    //   );
    // }

    //redirect
  }

  @override
  Widget build(BuildContext context) {
    // var readtoken = storage.read(key: 'token');
    // if (readtoken != null) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const OnBoardingPage(),
    //     ),
    //   );
    // } else {
    return Scaffold(
      backgroundColor: lightblueBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 130,
            height: 130,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ktalogo.png'),
              ),
            ),
          ),
          Text(
            'Sign In &\nStart your Application',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE : EMAIL INPUT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email Address',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                // NOTE : Password INPUT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: blueTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      postData();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: whiteTextSyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneInputPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Create New Account',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // }
    // return Scaffold();
  }
}
