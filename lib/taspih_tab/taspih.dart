import 'package:flutter/material.dart';
import 'package:islamy_application/taspih_tab/taspih_icon.dart';
import 'package:provider/provider.dart';
import '../provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Taspih extends StatefulWidget {
  Taspih({super.key});
  @override
  State<Taspih> createState() => _TaspihState();
}

class _TaspihState extends State<Taspih> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
          return  SingleChildScrollView (// this will make your body scrollable
            physics: PageScrollPhysics(),
            child: Column(
              /// your parameters
              children: [
                TaspihIcon(text_sp7a_zekr_1:  AppLocalizations.of(context)!.text_sp7a_zekr_1)
               , TaspihIcon(text_sp7a_zekr_1:  AppLocalizations.of(context)!.text_sp7a_zekr_2)
               , TaspihIcon(text_sp7a_zekr_1:  AppLocalizations.of(context)!.text_sp7a_zekr_3)
               , TaspihIcon(text_sp7a_zekr_1:  AppLocalizations.of(context)!.text_sp7a_zekr_4)
               , TaspihIcon(text_sp7a_zekr_1:  AppLocalizations.of(context)!.text_sp7a_zekr_5)
              ],
            ),
          );
  }
}