import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/app_config_provider.dart';
import '../widgets/app_colors.dart';

class TaspihIcon extends StatefulWidget {
  String text_sp7a_zekr_1;
   TaspihIcon({required this.text_sp7a_zekr_1});
  int counter=0;

  @override
  State<TaspihIcon> createState() => _TaspihIconState();
}

class _TaspihIconState extends State<TaspihIcon> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(
          child: IconButton(
            icon: provider.isDarkMode()?
            Image.asset('assets/images/body of seb7a.png')
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
        SizedBox(height: MediaQuery.of(context).size.height*0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.1,)
            ,Container(
              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.width*0.2,
              decoration: BoxDecoration(
                color: provider.isDarkMode() ?
                AppColors.yellowColor
                    :
                AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                  onPressed:
                  () => showDialog<String>(
                  context: context,
                  builder:
                  (BuildContext context) => AlertDialog(
                  title:  Text(AppLocalizations.of(context)!.warningInCounter , style: TextStyle(
                      fontSize: 30 ,
                      color: AppColors.blackColor
                  ),),
                  content:  Text(AppLocalizations.of(context)!.messageWarningInCounter , style: TextStyle(
                      fontSize: 30 ,
                      color: AppColors.blackColor
                  ),),
                  actions: <Widget>[
                  TextButton(
                  onPressed: () => Navigator.pop(context, AppLocalizations.of(context)!.cancelCounter),
                  child:  Text(AppLocalizations.of(context)!.cancelCounter , style: TextStyle(
                      fontSize: 30 ,
                      color: AppColors.blackColor
                  ),),
                  ),
                  TextButton(
                  onPressed: () {
                    widget.counter=0;
                    Navigator.pop(context,AppLocalizations.of(context)!.okCounter);
                    setState(() {
                    });
                    },
                  child:  Text(AppLocalizations.of(context)!.okCounter ,style: TextStyle(
    fontSize: 30 ,
    color: AppColors.blackColor
    ),),
                  ),
                  ],
                  ),
                  ),
                  child: Text(AppLocalizations.of(context)!.returnCounter,style: TextStyle(
                    fontSize: 30 ,
                    color: AppColors.blackColor
                  ),),
                  ),
            )]
        )
        ,SizedBox(height: MediaQuery.of(context).size.height*0.01)
        ,Container(
          padding: EdgeInsets.all(20),
          child: Text(
              widget.text_sp7a_zekr_1
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
