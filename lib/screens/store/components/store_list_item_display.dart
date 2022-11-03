import 'package:ecommerce_int2/models/store.dart';
import 'package:flutter/material.dart';

class StoreListItemDisplay extends StatelessWidget {
  final Store store;
  final VoidCallback onPressed;

  const StoreListItemDisplay(this.store, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(children: <Widget>[
        Positioned(
          left: 25,
          top: 10,
          child: SizedBox(
            height: 80,
            width: 80,
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset('assets/bottom_purple.png'),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 5,
          child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                '${store.image}',
                fit: BoxFit.contain,
              )),
        ),
      ]),
    );
  }
}