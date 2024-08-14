// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_test/app_theme.dart';
import 'package:flutter_new_test/tabs/quran/guran_tap.dart';
import 'package:flutter_new_test/tabs/settings/setting_provider.dart';
import 'package:flutter_new_test/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class suraDetailsScreen extends StatefulWidget {
  static const String routeName = "?sura_details";

  @override
  State<suraDetailsScreen> createState() => _suraDetailsScreenState();
}

class _suraDetailsScreenState extends State<suraDetailsScreen> {
  List<String> ayat = [];
  late suraDetailsArgs args;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    args = ModalRoute.of(context)!.settings.arguments as suraDetailsArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            settingProvider.BackgroundImagePath,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(args.suraName)
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.06,
            horizontal: MediaQuery.of(context).size.width * 0.07,
          ),
          decoration: BoxDecoration(
            color: settingProvider.isDark ? Apptheme.black : Apptheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ayat.isEmpty
              ? LoadingIndicator()
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    ayat[index],
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: ayat.length,
                ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(Duration(seconds: 2));
    String sura =
        await rootBundle.loadString('assets/files/${args.index + 1}.txt');
    ayat = sura.split("\r\n");
    setState(() {});
  }
}
