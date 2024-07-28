import 'package:flutter/material.dart';
import 'package:flutter_new_test/app_theme.dart';
import 'package:flutter_new_test/home_page.dart';
import 'package:flutter_new_test/tabs/quran/sura_details_screen.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
      HomePage.routeName:(_) => HomePage(),
      suraDetailsScreen.routeName:(_) =>suraDetailsScreen(),
      },
      theme:Apptheme.lightThem ,
      themeMode:ThemeMode.light , 
      darkTheme:Apptheme.darkThem ,
      
    );
  }
}