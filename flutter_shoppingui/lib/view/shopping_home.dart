import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/datagetting.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
