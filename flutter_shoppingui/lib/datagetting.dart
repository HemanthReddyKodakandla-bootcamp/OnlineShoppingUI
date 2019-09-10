import 'dart:convert';

import 'package:flutter/widgets.dart';
class Data{
  var bagsData;
  var jacketsData;
  var shoesData;

  getBagsData(BuildContext context) async{
        var data = await DefaultAssetBundle.of(context).loadString("assets/bags.json");
        bagsData = jsonDecode(data);
        print('bags data $bagsData');

  }

  getShoesData(BuildContext context) async{
    var data = await DefaultAssetBundle.of(context).loadString("assets/shoes.json");
    shoesData = jsonDecode(data);
    print('shoes data $shoesData');

  }

  getJacketsData(BuildContext context) async{
    var data = await DefaultAssetBundle.of(context).loadString("assets/jackets.json");
    jacketsData = jsonDecode(data);
    print('jackets data $jacketsData');

  }

}