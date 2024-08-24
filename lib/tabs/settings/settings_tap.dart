import 'package:flutter/material.dart';
import 'package:flutter_new_test/app_theme.dart';
import 'package:flutter_new_test/tabs/settings/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.darkMode,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Switch(
                value: settingProvider.isDark,
                onChanged: (isDark) => settingProvider.changeThemMode(
                  isDark ? ThemeMode.dark : ThemeMode.light,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: settingProvider.language,
                    items: [
                      DropdownMenuItem(
                        value: "en",
                        child: Text("English",style: Theme.of(context).textTheme.titleLarge,),
                      ),
                      DropdownMenuItem(
                        value: "ar",
                        child: Text("Arabic",style: Theme.of(context).textTheme.titleLarge ,),
                      ),
                    ],
                    onChanged: (SelectedLanguage) {
                      if (SelectedLanguage == null) return;
                      settingProvider.changeLanguage(SelectedLanguage);
                    },
                      borderRadius:BorderRadius.circular(20),
                      dropdownColor:Apptheme.white,
                    ),
                    
              ),
            ],
          )
        ],
      ),
    );
  }
}
