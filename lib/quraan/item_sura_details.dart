import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_application/widgets/app_colors.dart';

class Item_sura_details extends StatelessWidget {
  String content ;
  int index ;
  Item_sura_details({required this.content,required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Text(
    '$content(${index+1})',
      style: Theme.of(context).textTheme.titleLarge,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    )
        ,Divider(thickness: 2,color: AppColors.primaryColor,)
      ],
    );

  }
}
