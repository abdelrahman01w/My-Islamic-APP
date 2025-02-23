import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_application/setting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_bottom_sheet.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container( child: Column(
      children: [
        SizedBox(height: 22,),
        Text(AppLocalizations.of(context)!.language_setting,style: Theme.of(context).textTheme.bodyMedium,)
        ,SizedBox(height: 22,)
        ,InkWell(
          onTap: (){
            showLanguageBottomSheet();
          },
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:  provider.isDarkMode()? AppColors.yellowColor
                  :
              AppColors.primaryColor,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.appLanguage=='en'?
                AppLocalizations.of(context)!.language_english
                    :
                AppLocalizations.of(context)!.language_arabic
                ),
                Icon(Icons.arrow_drop_down,size: 50,)
              ],
            ),
          ),
        ),



        SizedBox(height: 22,),
        Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.bodyMedium,)
        ,SizedBox(height: 22,)
        ,InkWell(
          onTap: (){
            showThemeBottomSheet();
          },
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:  provider.isDarkMode()? AppColors.yellowColor
                  :
              AppColors.primaryColor,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( provider.isDarkMode()?
                AppLocalizations.of(context)!.dark :
                AppLocalizations.of(context)!.light
                ),
                Icon(Icons.arrow_drop_down,size: 50,)
              ],
            ),
          ),
        )
      ],
    ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(backgroundColor:AppColors.yellowColor,context: context, builder: (context)=> Language_bottom_sheet());
  }

  void showThemeBottomSheet() {

    showModalBottomSheet(backgroundColor:AppColors.yellowColor,context: context, builder: (context)=>Theme_bottom_sheet());
  }
}