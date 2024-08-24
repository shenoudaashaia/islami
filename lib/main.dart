//  import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_new_test/app_theme.dart';
import 'package:flutter_new_test/home_page.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth_details_screen.dart';
import 'package:flutter_new_test/tabs/quran/sura_details_screen.dart';
import 'package:flutter_new_test/tabs/settings/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final settingProvider = SettingProvider();
            settingProvider.loadTheme();
            settingProvider.loadlanguage();
            return settingProvider;
          },
        ),
      ],
      child: IslamiApp(),
    ),
  );
}



class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    settingProvider.loadTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        suraDetailsScreen.routeName: (_) => suraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      theme: Apptheme.lightThem,
      themeMode: settingProvider.theme,
      darkTheme: Apptheme.darkThem,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.language),
    );
  }
}
