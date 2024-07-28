import 'package:flutter/material.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth_tap.dart';
import 'package:flutter_new_test/tabs/quran/guran_tap.dart';
import 'package:flutter_new_test/tabs/radio/radio_tap.dart';
import 'package:flutter_new_test/tabs/sebha/sebha_tap.dart';
import 'package:flutter_new_test/tabs/settings/settings_tap.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> taps = [
    GuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    SettingsTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"))),
      child: Scaffold(
        appBar: AppBar(
          title: Text("إسلامي"),
        ),
        body: taps[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                label: "quran",
                icon: ImageIcon(
                  AssetImage("assets/images/icon_quran.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "hadeth",
                icon: ImageIcon(
                  AssetImage("assets/images/icon_hadeth.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "sebha",
                icon: ImageIcon(
                  AssetImage("assets/images/icon_sebha.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "radio",
                icon: ImageIcon(
                  AssetImage("assets/images/radio_image.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "settings",
                icon: Icon(Icons.settings_outlined),
              ),
            ]),
      ),
    );
  }
}
