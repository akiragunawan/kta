import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kta/shared/theme.dart';

class Otp_input_page extends StatefulWidget {
  const Otp_input_page({super.key});

  @override
  State<Otp_input_page> createState() => _Otp_input_pageState();
}

class _Otp_input_pageState extends State<Otp_input_page> {
  int currentotp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 256,
              height: 256,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/otp.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
