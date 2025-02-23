import 'package:flutter/material.dart';

class Item_hadieth_details extends StatelessWidget {
  String content ;

  Item_hadieth_details({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text('$content',style: Theme.of(context).textTheme.titleLarge,);
  }
}
