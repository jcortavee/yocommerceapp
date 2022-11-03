import 'package:flutter/material.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);
const Color lightGrey = Color(0xffbbbbbb);


const Color purple = Color(0xffCAB8FF);
const Color transparentPurple = Color.fromRGBO(196, 122, 255, 0.7);
const Color mediumPurple = Color(0xff645CAA);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(70, 73, 255, 1),
  Color.fromRGBO(70, 73, 255, 1),
  Color.fromRGBO(70, 73, 255, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}