import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy_application/model/RadioModel.dart';
import 'package:islamy_application/radio/radio_item.dart';
import 'package:http/http.dart' as http;
class Radioo extends StatelessWidget {
  AudioPlayer player =AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getRadios(), builder: (context,snapshot){
      if(snapshot.hasData){
        List<Radios> radios= snapshot.data?.radios ?? [];
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Image.asset(''
                'assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png'))
            ,        Expanded(child: ListView.builder(
              physics: PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>SizedBox(
                width: MediaQuery.of(context).size.width,
                  child: RadioItem(radios: radios[index],player:player ,)),
              itemCount: 10,))
          ],
        );
      }else if(snapshot.hasError){
       return  Center(child: Text("Failed to load Radios"),);
      }else{
        return Center(child: CircularProgressIndicator( ),);
      }
    });
  }
   Future<RadioModel?>getRadios()async{
    var url = Uri.parse("https://mp3quran.net/api/v3/radios");
 var response = await http.get(url);
 if(response.statusCode != 200){
   print("something went wrong");
 }
    var json = jsonDecode(response.body);
    print(response.body);
    return RadioModel.fromJson(json);
  }
}