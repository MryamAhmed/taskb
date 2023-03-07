import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/onboard_models.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int currentIndex = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 80),
        child: Column(
            children:[
              Expanded(
                child: PageView.builder(
                    itemCount: screens.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context,index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(screens[index].img,height: 250),
                      SizedBox(height: 20),
                      Text(
                        screens[index].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        screens[index].desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),
              ),


              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(   //
                      screens.length,
                          (index) => Container(
                        height: 10,
                        width: currentIndex == index ? 20 : 10,  //الايندكس قيمته هتتغير ازاي
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepOrange
                        ),
                      )
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,borderRadius: BorderRadius.circular(20)
                ),
                height: 60,
                margin: EdgeInsets.all(40),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (currentIndex == screens.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    }
                    // _controller.nextPage(
                    //   duration: Duration(milliseconds: 100),
                    //   curve: Curves.bounceIn,
                    // );
                  },

                  child: Text(
                  currentIndex == screens.length - 1 ? "Continue" : "Next" ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                  ),

                ),
              )

        ],
        ),
      ),
    );
  }
}