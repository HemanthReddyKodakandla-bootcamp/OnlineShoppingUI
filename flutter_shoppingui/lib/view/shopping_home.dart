import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/datagetting.dart';
import 'package:flutter_shoppingui/view/bags_view.dart';
import 'package:flutter_shoppingui/view/shoes_view.dart';

class ShoppingHomeView extends StatefulWidget {
  @override
  _ShoppingHomeViewState createState() => _ShoppingHomeViewState();
}

class _ShoppingHomeViewState extends State<ShoppingHomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data().getBagsData(context);
    Data().getShoesData(context);
    Data().getJacketsData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
