import 'package:flutter/material.dart';
import 'package:flutter_shoppingui/datagetting.dart';
import 'package:flutter_shoppingui/main.dart';
import 'package:flutter_shoppingui/view/bags_view.dart';
import 'package:flutter_shoppingui/view/jackets_view.dart';
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
    Data().getShoesData(context);
    Data().getJacketsData(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Popular',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25.0),),
              Icon(Icons.keyboard_arrow_down,size: 20.0,color: Colors.black,)
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(2.0,2.0,10.0,2.0),
            child:Material(
                child: InkWell(
                  onTap: (){
                    ShoppingUI.myTabbedPageKey.currentState.tabController.animateTo(2);
                  },
                    child: Icon(Icons.shopping_basket,color: Colors.black,size: 25.0,))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,2.0,10.0,2.0),
              child: Icon(Icons.search,color: Colors.black,size: 25.0,),
            )
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            indicatorColor: Colors.purple,
            unselectedLabelColor: Colors.grey[100],
            unselectedLabelStyle:TextStyle(color:Colors.grey[100],fontSize: 20.0,fontWeight: FontWeight.w900),
            tabs: [
              Tab(child: Text('Bags',style: TextStyle(color:Colors.blue,fontSize: 20.0,fontWeight: FontWeight.w900),)),
              Tab(child: Text('Shoes',style: TextStyle(color:Colors.blue,fontSize: 20.0,fontWeight: FontWeight.w900))),
              Tab(child: Text('Jackets',style: TextStyle(color:Colors.blue,fontSize: 20.0,fontWeight: FontWeight.w900))),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            BagsView(),
            ShoesView(),
            JacketsView()
          ],
        ),
      ),
    );
  }
}
