import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';
import 'item_hadeeth_name.dart';

class Hadith extends StatefulWidget {

  @override
  State<Hadith> createState() => _HadithState();
}

class _HadithState extends State<Hadith> {
  List<HadiethData>ahadithList=[];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    hadithList();
    return Column(
      children: [
        Expanded(flex:1 ,child: Image.asset('assets/images/2x/quran_header_icn.png')),
        Divider( ///for line
          color: provider.isDarkMode()?
          AppColors.yellowColor
              :
          AppColors.primaryColor,
          thickness: 4,
        )
        ,Text('رقم الحديث',
          style: Theme.of(context).textTheme.bodyMedium,)
        ,Divider( ///for line
          color: provider.isDarkMode()?
          AppColors.yellowColor
              :
          AppColors.primaryColor,          thickness: 4,
        )
        ,Expanded( flex: 2 ,child:ahadithList.isEmpty ?
        CircularProgressIndicator(color: AppColors.primaryColor,)
            :
        ListView.separated(
          separatorBuilder:(context,index){
            return Divider( ///for line
              color: provider.isDarkMode()?
              AppColors.yellowColor
                  :
              AppColors.primaryColor,              thickness: 2,
            ) ;
          },
          itemBuilder: (context,index){
            //return Text(ahadithList[index].title);
            return ItemHadiethName(hadithh: ahadithList[index]);
          },
          itemCount: ahadithList.length,
        ))
      ],
    );
  }

  void hadithList()async{
    String hadeathContent =await rootBundle.loadString('assets/hadeath/ahadeth.txt');
    List<String> hadeathList = hadeathContent.split('#\r\n');
    for(int i=0;i<hadeathList.length;i++){
      List<String>hadeathLines = hadeathList[i].split('\n');
      String title = hadeathLines[0];
      hadeathLines.removeAt(0);
      HadiethData hadith =HadiethData(title: title, hadeath: hadeathLines);
      ahadithList.add(hadith);
      setState(() {

      });
    }
  }
}
///data class for hadieth
class HadiethData {
  String title;
  List<String>hadeath;
  HadiethData({required this.title ,required this.hadeath});

}
