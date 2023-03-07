
import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String desc;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
  });
}


List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: 'assets/images/food.jpg',
    text: "Everything you need, a tap away",
    desc:
    "Here you can choose any order you want from thousands of types, you will definitely find what you like",

  ),
  OnboardModel(
    img: 'assets/images/resturantes.jpg',
    text: "Your favorite restaurant ",
    desc:
    "Here you can choose among the famous restaurants that you like, and you will definitely find what you like",

  ),
  OnboardModel(
    img: 'assets/images/delivery.jpg',
    text: "DELIVERY",
    desc:
    "We can also reach you wherever you are, cheap and fast delivery service",

  ),
];