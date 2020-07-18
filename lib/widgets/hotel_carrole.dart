import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_me/models/destination_model.dart';
import 'package:travel_me/models/hotel_model.dart';
class HotelCarrole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Destinations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),),
              GestureDetector(
                onTap: ()=>print('see all'),
                child: Text("See All",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor
                  ),),
              )
            ],
          ),
        ),
        Container(
          height: 300,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,

            itemBuilder: (BuildContext context,int index){
              Hotel hotel = hotels[index];
              return Container(
                height: 240,
                margin: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom:15,
                      child: Container(
                        height: 120,
                        width: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('${hotel.name}',
                                style: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text('${hotel.price.toString()}\$/night',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(hotel.address,
                                style: TextStyle(
                                  color: Colors.grey,

                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(hotel.imageUrl),
                                height: 180,
                                width: 220,
                                fit: BoxFit.cover,
                              ),
                            ),


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
