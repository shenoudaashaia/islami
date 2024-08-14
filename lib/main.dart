import 'package:flutter/material.dart';
import 'package:flutter_new_test/app_theme.dart';
import 'package:flutter_new_test/home_page.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth_details_screen.dart';
import 'package:flutter_new_test/tabs/quran/sura_details_screen.dart';
import 'package:flutter_new_test/tabs/settings/setting_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => SettingProvider(), child: IslamiApp()),
  );
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        suraDetailsScreen.routeName: (_) => suraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      theme: Apptheme.lightThem,
      themeMode: settingProvider.themeMode,
      darkTheme: Apptheme.darkThem,
    );
  }
}
