import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/view/home.dart';

void main() => runApp(ShoppingUI());

class ShoppingUI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light, fontFamily: 'Quicksand'),
      home: HomeView(),
    );
  }
}

