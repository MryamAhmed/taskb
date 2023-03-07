import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 2,),
          Center(
            child: Container(
              child: Image.asset('assets/images/logo.png'),
            ),
          ),

        ],
      ),
    );
  }
}
