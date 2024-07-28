import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_new_test/app_theme.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int count = 0;
  String text = "سبحان الله";
  double angle = 0;
  List<String> words = [
    'الحمد لله',
    'لا اله الا اله',
    'الله اكبر',
    'سبحان الله',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.topCenter, children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/images/head_sebha_logo.png",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Transform.rotate(
              angle: angle,
              child: Image.asset(
                "assets/images/body_sebha_logo.png",
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        Text(
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Apptheme.lightPrimary,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          height: 81,
          width: 69,
          child: Text("$count"),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Apptheme.lightPrimary,
            ),
            onPressed: () {
              setState(() {
                angle += 1;
                count++;
                if (count % 33 == 0 && count != 0) {
                  int wordIndex = (count ~/ 33 - 1) % words.length;
                  text = words[wordIndex];
                }
              });
            },
            child: Text(
              "$text",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            )),
        Row(),
      ],
    );
  }
}
