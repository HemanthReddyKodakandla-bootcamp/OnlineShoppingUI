import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_shoppingui/db_modal/bags_helper.dart';
import 'package:flutter_shoppingui/db_modal/favorites_helper.dart';
import 'package:flutter_shoppingui/db_modal/favorites_modal.dart';
import 'package:flutter_shoppingui/db_modal/jackets_helper.dart';
import 'package:flutter_shoppingui/db_modal/jackets_modal.dart';
import 'package:flutter_shoppingui/db_modal/shoes_helper.dart';
import 'package:flutter_shoppingui/db_modal/shoes_modal.dart';

import 'db_modal/bags_modal.dart';
class Data{
  var bagsData;
  var jacketsData;
  var shoesData;

  Future<List> getBagsData(BuildContext context) async{
        var bagData = await DefaultAssetBundle.of(context).loadString("assets/bags.json");
        bagsData =  jsonDecode(bagData);
        print('bags data $bagsData');
        BagsDataBaseHelper().getUser().then((data){

          if(data.length == 0){
            for(var bag in bagsData){
              Bags each_bag = Bags(
                  title: bag['title'],
                  description: bag['description'],
                  price: bag['price'],
                  category:  bag['category'],
                  image:  bag['image'],
                  colors: jsonEncode(bag['colors']).toString(),
              );
              BagsDataBaseHelper().saveAttendeesDetails(each_bag);
            }
          }
        });
        return BagsDataBaseHelper().getUser();
  }

  Future<List> getShoesData(BuildContext context) async{
    var shoeData = await DefaultAssetBundle.of(context).loadString("assets/shoes.json");
    shoesData =  jsonDecode(shoeData);
    print('shoes data $shoesData');
    ShoesDataBaseHelper().getUser().then((data){

      if(data.length == 0){
        for(var shoe in shoesData){
          Shoes each_shoe = Shoes(
            title: shoe['title'],
            description: shoe['description'],
            price: shoe['price'],
            category:  shoe['category'],
            image:  shoe['image'],
            colors: jsonEncode(shoe['colors']).toString(),
          );
          ShoesDataBaseHelper().saveAttendeesDetails(each_shoe);
        }
      }
    });
    return ShoesDataBaseHelper().getUser();
  }

  Future<List> getJacketsData(BuildContext context) async{
    var jacketData = await DefaultAssetBundle.of(context).loadString("assets/jackets.json");
    jacketsData =  jsonDecode(jacketData);
    print('jackets data $jacketsData');
    ShoesDataBaseHelper().getUser().then((data){

      if(data.length == 0){
        for(var jacket in jacketsData){
          Jackets each_jacket = Jackets(
            title: jacket['title'],
            description: jacket['description'],
            price: jacket['price'],
            category:  jacket['category'],
            image:  jacket['image'],
            colors: jsonEncode(jacket['colors']).toString(),
          );
          JacketsDataBaseHelper().saveAttendeesDetails(each_jacket);
        }
      }
    });
    return JacketsDataBaseHelper().getUser();  }

    saveDataToFavoritesDataBase(var data){
      Favorites favorite_item = Favorites(
        title: data.title,
        description: data.description,
        price: data.price,
        category:  data.category,
        image:  data.image,
        colors: data.colors,
      );
      FavoritesDataBaseHelper().saveAttendeesDetails(favorite_item);
    }
}