import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  var theme = false;
  var scaffold_color = Colors.white;
  var text_color = Colors.black;

  change_theme(){
    setState(() {
      theme = !theme;
      scaffold_color = theme?Colors.black:Colors.white;
      text_color = theme?Colors.white:Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffold_color,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: text_color,
        ),
        elevation: 0.0,
        backgroundColor: scaffold_color,
        actions: <Widget>[
          Icon(
              Icons.favorite_border,
              color: text_color
          ),
          Icon(
            Icons.more_vert,
            color: text_color,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            _profilePicWidget(),
            _profileWidget(),
            _socialMediaIcons(),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () {
                change_theme();
              },
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              color: Colors.blue,
              child: Text(
                'Change Theme',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Divider(
              color: text_color,
              height: 2.0,
              indent: 30,
              endIndent: 30.0,
            ),
            _socialMediaFollowers()
          ],
        ),
      ),
    );
  }

  _profilePicWidget() {
    return Center(
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
        radius: 40.0,
        foregroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45.0,
            left: 60.0,
          ),
          child: Container(
            width: 22.0,
            height: 22.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              color: Colors.blue,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 17.0,
            ),
          ),
        ),
      ),
    );
  }

  _profileWidget() {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          Text(
            'John Wick',
            style: TextStyle(
                color: text_color,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          Text(
            'CONTRACT KILLER',
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Man of focus, commitment, sheer will',
            style: TextStyle(
                color: text_color,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Container(
            child: Text(
              '\@Johnwick',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: text_color,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }

  _socialMediaIcons() {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: Image.asset(
              "assets/images/twitter_icon.png",
              height: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20.0),
            child: Image.asset(
              "assets/images/icons_medium.png",
              height: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              child: Image.asset(
                "assets/images/icons_linkedin.png",
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _socialMediaFollowers() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
                radius: 32.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "8.3M",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: text_color,
                ),
              ),
              Text(
                "Followers",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              CircleAvatar(
                child: Text(
                  'JW',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                radius: 32.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "1.3k",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: text_color,
                ),
              ),
              Text(
                "Followers",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
