import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Taspih extends StatefulWidget {
  Taspih({super.key});
  int counter=0;
  @override
  State<Taspih> createState() => _TaspihState();
}

class _TaspihState extends State<Taspih> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(
          child: IconButton(
            icon: provider.isDarkMode()?
            Image.asset('assets/images/body of seb7a dark theme.png')
                :
            Image.asset('assets/images/body of seb7a.png'),
            iconSize:300 ,
            onPressed: () {
              setState(() {
                widget.counter++;
              });
            },
          ),
        )
        , Text(AppLocalizations.of(context)!.text_sp7a,style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: MediaQuery.of(context).size.height*0.02),
        Container(
          padding: EdgeInsets.all(24),
          child: Text(
              '${widget.counter}'
          ),
          decoration: BoxDecoration(color: provider.isDarkMode()?
          AppColors.yellowColor
              :
          AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        )
        ,SizedBox(height: MediaQuery.of(context).size.height*0.02)
        ,Container(
          padding: EdgeInsets.all(20),
          child: Text(
              AppLocalizations.of(context)!.text_sp7a_zekr_1
          ),
          decoration: BoxDecoration(
            color: provider.isDarkMode() ?
            AppColors.yellowColor
                :
            AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ],
    );
  }
}