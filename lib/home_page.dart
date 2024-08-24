import 'package:flutter/material.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth_tap.dart';
import 'package:flutter_new_test/tabs/quran/guran_tap.dart';
import 'package:flutter_new_test/tabs/radio/radio_tap.dart';
import 'package:flutter_new_test/tabs/sebha/sebha_tap.dart';
import 'package:flutter_new_test/tabs/settings/setting_provider.dart';
import 'package:flutter_new_test/tabs/settings/settings_tap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Provider.of<SettingProvider>(context).BackgroundImagePath,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
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
                label: AppLocalizations.of(context)!.quran,
                icon: ImageIcon(
                  AssetImage("assets/images/icon_quran.png"),
                ),
              ),
              BottomNavigationBarItem(
                label:AppLocalizations.of(context)!.hadeth,
                icon: ImageIcon(
                  AssetImage("assets/images/icon_hadeth.png"),
                ),
              ),
              BottomNavigationBarItem(
                label:AppLocalizations.of(context)!.sebha,
                icon: ImageIcon(
                  AssetImage("assets/images/icon_sebha.png"),
                ),
              ),
              BottomNavigationBarItem(
                label:AppLocalizations.of(context)!.radio,
                icon: ImageIcon(
                  AssetImage("assets/images/icon_radio.png"),
                ),
              ),
              BottomNavigationBarItem(
                label:AppLocalizations.of(context)!.settings,
                icon: Icon(Icons.settings_outlined),
              ),
            ]
            ),
      ),
    );
  }
}
