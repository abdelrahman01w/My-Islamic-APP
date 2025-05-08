import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_application/provider/app_config_provider.dart';
import 'package:islamy_application/quraan/quraan.dart';
import 'package:islamy_application/radio/radio.dart';
import 'package:islamy_application/setting/setting.dart';
import 'package:islamy_application/taspih_tab/taspih.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'hadeeth/hadeeth.dart';
class Home_screen extends StatefulWidget {
  static const String routeName ='Home_screen';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/home_dark_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,)
            :
        Image.asset('assets/images/1x/background_home_1x.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title
              ,style:Theme.of(context).textTheme.bodyLarge ,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor /// for change backgroundColor BottomNavigationBarThemeData for old versions
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                selectIndex=index;
                setState(() {
                });
              },
              currentIndex: selectIndex,
              items : [
                BottomNavigationBarItem(icon: Image.asset('assets/images/2x/quran.png'),label: AppLocalizations.of(context)!.quraan_icon)
                , BottomNavigationBarItem(icon: Image.asset('assets/images/2x/quran-quran-svgrepo-com.png'),label:AppLocalizations.of(context)!.hadeeth_icon)
                , BottomNavigationBarItem(icon: Image.asset('assets/images/2x/radio.png'),label:AppLocalizations.of(context)!.radio_icon)
                , BottomNavigationBarItem(icon: Image.asset('assets/images/2x/sebha.png'),label:AppLocalizations.of(context)!.sebha_icon)
                , BottomNavigationBarItem(icon: Icon(Icons.settings,size: 44,) , label:AppLocalizations.of(context)!.setting_icon)
              ],
            ),
          ),
          body: taps[selectIndex],
        ),
      ],
    );
  }
  List<Widget>taps=[
    Quraan(),Hadith(),Radioo(),Taspih(),Setting()
  ];
}