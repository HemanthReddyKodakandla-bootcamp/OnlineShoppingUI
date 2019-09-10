import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/view/home.dart';

void main() => runApp(ShoppingUI());

class ShoppingUI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

