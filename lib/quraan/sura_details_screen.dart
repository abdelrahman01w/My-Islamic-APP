
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';
import 'item_sura_details.dart';

class Sura_details_screen extends StatefulWidget {
  static const String routeName='Sura_details_screen';

  @override
  State<Sura_details_screen> createState() => _Sura_details_screenState();
}

class _Sura_details_screenState extends State<Sura_details_screen> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args =ModalRoute.of(context)?.settings.arguments as SuraDetailsArgeu ; ///for take the sura name from quraan tob
    if(verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
        children: [ provider.isDarkMode()?
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
              title: Text(args.suraName
                ,style:Theme.of(context).textTheme.bodyLarge ,
              ),
            ),
            body: verses.isEmpty ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)) ///loading item
                :
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
                return Item_sura_details(content : verses[index] ,index: index,);
              }, itemCount: verses.length,),
            ),
          ),
        ]
    );
  }

  void loadFile(int index)async{ ///rootBundle.loadString : for read text from files in assets
    String content =await rootBundle.loadString('assets/ayaat/${index+1}.txt');
    List<String> lines = content.split('\n');/// for cut the text from file to ayaat in lines
    verses=lines;
    setState(() {

    });
  }
}
///data class
class SuraDetailsArgeu{
  String suraName;
  int index;
  SuraDetailsArgeu({required this.suraName ,required this.index});
}