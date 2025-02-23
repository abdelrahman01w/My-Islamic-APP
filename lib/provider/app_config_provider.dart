import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  /// this class save the data that changed when we use the provider
  String appLanguage='en';
  ThemeMode appTheme =ThemeMode.light;
  void changeLanguage(String newLanguage){
    if(newLanguage==appLanguage){
      return;
    }
    appLanguage=newLanguage;
    notifyListeners();///function take the order from provider and it give notification for listeners

  }
  void changeTheme(ThemeMode newTheme){
    if(appTheme==newTheme){
      return ;
    }
    appTheme=newTheme;
    notifyListeners();
  }
  bool isDarkMode(){
    return appTheme==ThemeMode.dark;
  }
}