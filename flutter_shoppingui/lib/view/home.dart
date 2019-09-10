import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/datagetting.dart';
import 'package:flutter_shoppingui/view/bags_view.dart';
import 'package:flutter_shoppingui/view/jackets_view.dart';
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
    ShoesView(),
    JacketsView()
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
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Shopping',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
            title: Text('Home'),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
            title: Text('Home'),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home),
            title: Text('Home'),
          )
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.purple[300],
        selectedItemColor: Colors.grey[300],
        onTap: _onItemTapped,
      ),
      body: Container(
        child: bottomWidgets.elementAt(_selectedIndex),
      ),
    );
  }
}
