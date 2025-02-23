import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_application/model/RadioModel.dart';
import 'package:islamy_application/radio/radio.dart';
import 'package:islamy_application/widgets/app_colors.dart';
class RadioItem extends StatefulWidget {
   AudioPlayer player;
  Radios radios ;
   RadioItem({required this.radios,required this.player});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.radios.name??"",style: Theme.of(context).textTheme.bodyLarge,)
    ,SizedBox(height:MediaQuery.of(context).size.height*0.08 ,)
    , Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    IconButton(onPressed: ()async{
      await widget.player.play(UrlSource(widget.radios.url??""));
    },
    icon:Icon(Icons.play_arrow,size: MediaQuery.of(context).size.height*0.08,color: AppColors.primaryColor,))
    ,SizedBox(width:MediaQuery.of(context).size.width*0.1 ,),
    IconButton(onPressed: () async{
      await widget.player.pause();
    }, icon:Icon(Icons.stop,size: MediaQuery.of(context).size.height*0.08,color: AppColors.primaryColor))
    ],
    )
    ],);
  }
}
