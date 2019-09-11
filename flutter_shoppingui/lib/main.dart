import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/view/bags_view.dart';
import 'package:flutter_shoppingui/view/favorites.dart';
import 'package:flutter_shoppingui/view/profile.dart';
import 'package:flutter_shoppingui/view/shopping_home.dart';

void main() => runApp(ShoppingUI());

class ShoppingUI extends StatelessWidget {
  // This widget is the root of your application.
  static final myTabbedPageKey = new GlobalKey<_HomeViewState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light, fontFamily: 'Quicksand'),
      home: HomeView(
        key: myTabbedPageKey,
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {

  int _selectedIndex =0;

  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.blue,
          height: 50.0,
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
            controller: tabController,
            tabs:
            [
              _buildBottomNavigationItem(icon: Icon(Icons.home),title: "Home",),
              _buildBottomNavigationItem(icon: Icon(Icons.chat_bubble_outline),title: "Chat"),
              _buildBottomNavigationItem(icon: Icon(Icons.favorite_border),title: "Favorites"),
              _buildBottomNavigationItem(icon: Icon(Icons.person_outline),title: "Account"),
            ],
//        currentIndex: _selectedIndex,

            onTap: _onItemTapped,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          ShoppingHomeView(),
          BagsView(),
          FavoritesView(),
          MyProfilePage(),
        ],
//        child: bottomWidgets.elementAt(_selectedIndex),
      ),
    );
  }

  _buildBottomNavigationItem({Icon icon,String title}){
    return  Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
          child: icon),
    );
  }
}


