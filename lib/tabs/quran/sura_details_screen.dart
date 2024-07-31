import 'package:flutter/material.dart';
import 'package:flutter_new_test/tabs/quran/guran_tap.dart';

class suraDetailsScreen extends StatelessWidget {
  static const String routeName = "?sura_details";
  @override
  Widget build(BuildContext context) {
    suraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as suraDetailsArgs;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/default_bg.png"))),
        child: Scaffold(
          appBar: AppBar(title: Text(args.suraName)),
          body:Container(
            padding: EdgeInsets.all(24),
            
          ),
        ));
  }
}
