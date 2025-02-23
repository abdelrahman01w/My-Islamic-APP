import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';
import 'hadeeth.dart';
import 'item_hadeeth_details_screen.dart';

class Hadeath_details_screen extends StatefulWidget {
  static const String routeName='Hadeath_details_screen';

  @override
  State<Hadeath_details_screen> createState() => _Hadeath_details_screen();
}

class _Hadeath_details_screen extends State<Hadeath_details_screen> {

  @override
  Widget build(BuildContext context) {
    var args =ModalRoute.of(context)?.settings.arguments as HadiethData ; ///for take the sura name from quraan tob
    var provider=Provider.of<AppConfigProvider>(context);

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
              title: Text(args.title
                ,style:Theme.of(context).textTheme.bodyLarge ,
              ),
            ),
            body:
            Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,
                  vertical: MediaQuery.of(context).size.height*0.04),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()?
                  AppColors.primaryColorDark
                      :
                  AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(22)
              ),
              child: ListView.builder(itemBuilder: (context,index){
                return Item_hadieth_details(content : args.hadeath[index]);
              }, itemCount: args.hadeath.length,),
            ),
          ),
        ]
    );
  }

}
