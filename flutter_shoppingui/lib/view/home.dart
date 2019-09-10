import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/datagetting.dart';
import 'package:flutter_shoppingui/view/bags_view.dart';
import 'package:flutter_shoppingui/view/favorites.dart';
import 'package:flutter_shoppingui/view/jackets_view.dart';
import 'package:flutter_shoppingui/view/profile.dart';
import 'package:flutter_shoppingui/view/shoes_view.dart';
import 'package:flutter_shoppingui/view/shopping_home.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex =0;

  List<Widget> bottomWidgets = [
    ShoppingHomeView(),
    BagsView(),
    FavoritesView(),
    MyProfilePage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data().getBagsData(context);
    Data().getShoesData(context);
    Data().getJacketsData(context);
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    print('select $_selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          _buildBottomNavigationItem(icon: Icon(Icons.home),title: "Home",),
          _buildBottomNavigationItem(icon: Icon(Icons.chat_bubble_outline),title: "Chat"),
          _buildBottomNavigationItem(icon: Icon(Icons.favorite_border),title: "Favorites"),
          _buildBottomNavigationItem(icon: Icon(Icons.person_outline),title: "Account"),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple,
        selectedIconTheme: IconThemeData(color: Colors.white,size: 30.0,),
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.black87,size: 25.0),
        onTap: _onItemTapped,
      ),
      body: Container(
        child: bottomWidgets.elementAt(_selectedIndex),
      ),
    );
  }

  _buildBottomNavigationItem({Icon icon,String title}){
    return  BottomNavigationBarItem(
    icon: icon,
    title: Text(title),
);
}
}
