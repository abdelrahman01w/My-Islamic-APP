import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_application/quraan/sura_details_screen.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';

class Quraan extends StatelessWidget {
  List<String>suraNaes=[ "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
        ,Text('اسم السورة',
          style: Theme.of(context).textTheme.bodyMedium,)
        ,Divider( ///for line
          color:provider.isDarkMode()?
          AppColors.yellowColor
              :
          AppColors.primaryColor,
          thickness: 4,
        )
        ,Expanded( flex: 2 ,child: ListView.separated(
          separatorBuilder:(context,index){
            return Divider( ///for line
              color: provider.isDarkMode()?
              AppColors.yellowColor
                  :
              AppColors.primaryColor,
            ) ;
          },
          itemBuilder: (context,index){
            return InkWell(
              onTap : (){ ///for transfer the text to button
                Navigator.of(context).pushNamed(Sura_details_screen.routeName
                    ,arguments: SuraDetailsArgeu(suraName: suraNaes[index], index: index) ///for give sura name and index for sura_details_screen
                );
              },
              child: Text(suraNaes[index],
                  textAlign: TextAlign.center,
                  style:Theme.of(context).textTheme.bodyMedium),
            );
          },
          itemCount: suraNaes.length,

        ))


      ],
    );
  }
}