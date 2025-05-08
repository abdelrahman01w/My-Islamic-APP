import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_application/provider/app_config_provider.dart';
import 'package:islamy_application/quraan/sura_details_screen.dart';
import 'package:islamy_application/widgets/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hadeeth/hadeeth_details_screen.dart';
import 'home_screen.dart';
void main(){
  runApp(ChangeNotifierProvider(create:(context)=>AppConfigProvider() ,child: MyApp()));
  ///if we have a lot of provider we use
  ///MultiProvider(
  ///     providers: [
  ///       ChangeNotifierProvider(create: (context)=>AppConfigProvider()
  ///       )
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context); ///object from AppConfigProvider ,we must write it in build widget

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_screen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),  /// localization : language in flutter
      routes: {
        Home_screen.routeName: (context) => Home_screen(),
        Sura_details_screen.routeName: (context) => Sura_details_screen(),
        Hadeath_details_screen.routeName: (context) => Hadeath_details_screen(),
      }
      ,theme: MyThemeData.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.darkMode,
    );
  }
}
 