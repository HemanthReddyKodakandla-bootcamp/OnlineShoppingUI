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
        padding: EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                child: Hero(
                  tag: widget.favorteData['title'],
                  child: Image.network(widget.favorteData['image'],
                    height: MediaQuery.of(context).size.height*0.33,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
