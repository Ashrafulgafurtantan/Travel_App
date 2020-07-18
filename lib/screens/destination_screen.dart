import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_me/models/activity_model.dart';
import 'package:travel_me/models/destination_model.dart';


class DestinationScreen extends StatefulWidget {

  final Destination destination;
  DestinationScreen({this.destination});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[

              Container(
                height: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0.0,2.0),
                      )
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[


                    IconButton(icon: Icon(Icons.arrow_back,size: 30,color: Colors.black),

                      onPressed: ()=> Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.search, size: 30,color: Colors.black,),
                        SizedBox(width: 5),
                        Icon(FontAwesomeIcons.sortAmountDown, size: 25,color: Colors.black,),


                      ],
                    )

                  ],
                ),
              ),

              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.locationArrow,
                          size: 15,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5,),
                        Text(widget.destination.country,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              Positioned(
                right: 20,
                bottom: 25,
                child: Icon(Icons.location_on,size: 30,color: Colors.white70,),
              ),
              Positioned(
                right: 45,
                bottom: 40,
                child: Icon(Icons.location_on,size: 20,color: Colors.white70,),
              ),
            ],
          ),
          Expanded(

            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context,int index){
                Activity activity =widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40,5,20,5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                );
              },

            ),
          ),
        ],


      ),
    );
  }
}