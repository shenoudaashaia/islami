import 'package:flutter/material.dart';
import 'package:flutter_new_test/app_theme.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth.dart';
import 'package:flutter_new_test/tabs/settings/setting_provider.dart';
import 'package:flutter_new_test/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth-detalis';
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(settingProvider.BackgroundImagePath))),
        child: Scaffold(
          appBar: AppBar(title: Text(hadeth.title)),
          body: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            decoration: BoxDecoration(
              color: settingProvider.isDark? Apptheme.darkPrimary:Apptheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: hadeth.content.isEmpty
                ? LoadingIndicator()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(
                      hadeth.content[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount: hadeth.content.length,
                  ),
          ),
        ));
  }
}
