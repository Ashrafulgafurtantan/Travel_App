import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_me/widgets/destination_carrole.dart';
import 'package:travel_me/widgets/hotel_carrole.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int pageIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  int tappedIndex = 0;
  List<IconData>icons=[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          tappedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color:tappedIndex == index?  Theme.of(context).accentColor : Color(0xffe7ebee),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(icons[index],size: 25,
          color: tappedIndex == index? Theme.of(context).primaryColor:Color(0xffb4c1c4),),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20,right: 120),
              child: Text('What would you look to find',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildIcon(0),
                _buildIcon(1),
                _buildIcon(2),
                _buildIcon(3),
              ],
            ),
            SizedBox(height: 20,),
            DestinationCarrole(),
            HotelCarrole(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        color: Theme.of(context).accentColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        items: [
          Icon(Icons.search,size: 30,),
         Icon(FontAwesomeIcons.pizzaSlice,size: 30,),
          Icon(Icons.account_circle,size: 30,),
        ],
        onTap: (int pageIndex){
          setState(() {
            this.pageIndex = pageIndex;
          });
        },
      ),
    );
  }
}
