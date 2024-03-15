import 'dart:async';
import 'package:calculate_kcal/Start/BMI.dart';
import 'package:flutter/material.dart';

class LenderingScreen extends StatefulWidget {
  const LenderingScreen({super.key});

  @override
  State<LenderingScreen> createState() => _LenderingScreenState();
}

class _LenderingScreenState extends State<LenderingScreen> {
  @override
  void initState() {
    super.initState();

    // 일정 시간(예: 2초) 후에 다음 화면으로 이동
    Timer(
      Duration(seconds: 1),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BMI(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('asset/chacha.jpeg'),
              Text(
                'For My Body',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: ''
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
