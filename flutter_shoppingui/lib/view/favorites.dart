import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  var favorteData;
  FavoritesView(
      {Key key,
        @required this.favorteData,
      })
      : super(key: key);
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColorsWidget(widget.favorteData['colors']);
  }

  List<Widget> colorWidget = new List();

  getColorsWidget(var colors){
    for(var color in colors){
     var containerColor = int.parse('0xFF'+color.toString().replaceAll('#', ''));
     colorWidget.add(
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           height: 30.0,
           width: 30.0,
           decoration: BoxDecoration(
               color: Color(containerColor),
               shape: BoxShape.rectangle,
             borderRadius: BorderRadius.all(Radius.circular(5.0))
           ),
         ),
       )
     );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
              child: Icon(Icons.arrow_back_ios,size: 20.0,color: Colors.black,),
            ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0,0.0,15.0,0.0),
            child: Icon(Icons.more_vert,size: 25.0,color: Colors.black,),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                child: Hero(
                  tag: widget.favorteData['title'],
                  child: Image.network(widget.favorteData['image'],
                    height: MediaQuery.of(context).size.height*0.4,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 15.0),
                child: Text(widget.favorteData['category'],style: TextStyle(color: Colors.blue,fontSize: 15.0,fontWeight: FontWeight.w500),),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(widget.favorteData['description'],style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w600,fontSize: 20.0,fontStyle: FontStyle.italic),),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.favorite,size: 20.0,color: Colors.purple,),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10.0),
                child: Text(widget.favorteData['price'],style: TextStyle(color: Colors.purple,fontWeight: FontWeight.w600,fontSize: 18.0,fontStyle: FontStyle.italic)),
              ),
              _colorsWidgets(widget.favorteData['colors']),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: (){
                          debugPrint('button pressed');
                        },
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(25.0,5.0,25.0,5.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text('ADD TO CART',style: TextStyle(color: Colors.white,fontSize: 15.0),),
                    ),
                    OutlineButton(
                        onPressed: (){
                          debugPrint('button pressed');
                        },
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(30.0,5.0,30.0,5.0),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 2.0
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text('BUY NOW',style: TextStyle(color: Colors.purple,fontSize: 15.0),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _colorsWidgets(var colors){
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: colorWidget,
      ),
    );
  }
}
