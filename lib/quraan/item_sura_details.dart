import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item_sura_details extends StatelessWidget {
  String content ;
  int index ;
  Item_sura_details({required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    return Text('$content(${index+1})',style: Theme.of(context).textTheme.titleLarge,textDirection: TextDirection.rtl,);
  }
}
