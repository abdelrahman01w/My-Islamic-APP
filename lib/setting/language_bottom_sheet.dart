import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
/// state management X State Widget : widget affect on alot of screen and tap

class Language_bottom_sheet extends StatefulWidget {
  const Language_bottom_sheet({super.key});

  @override
  State<Language_bottom_sheet> createState() => _Language_bottom_sheetState();
}

class _Language_bottom_sheetState extends State<Language_bottom_sheet> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(13),
      color: Colors.black,
      child: Column(
        children: [
          InkWell(
              onTap: (){
                ///change language to English
                provider.changeLanguage('en');
              },
              child: provider.appLanguage=='en'?
              getSelectedItemWidget(AppLocalizations.of(context)!.language_english):
              getUnSelectedItemWidget(AppLocalizations.of(context)!.language_english)
          ),
          SizedBox(height:14),
          InkWell(
              onTap: (){
                ///change language to arabic
                provider.changeLanguage('ar');
              },
              child:provider.appLanguage=='ar'?
              getSelectedItemWidget(AppLocalizations.of(context)!.language_arabic):
              getUnSelectedItemWidget(AppLocalizations.of(context)!.language_arabic)
          )
        ],
      ),
    );
  }
  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.primaryColor),),
        Icon(Icons.check,color: AppColors.primaryColor,size: 20,),
      ],
    ) ;
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),);
  }
}
