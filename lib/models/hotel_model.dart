class Hotel{

 String imageUrl;
 String name;
String address;
  int price;

  Hotel({
   this.imageUrl,
    this.name,
    this.address,
    this.price,
});
}

final List<Hotel> hotels=[
  Hotel(
    imageUrl:"assets/images/hotel0.jpg" ,
    name: "Hotel 0",
    address: "444 Greate street",
    price: 175,
  ),
  Hotel(
    imageUrl: "assets/images/hotel1.jpg",
    name: "Hotel 1",
    address: "Love lane,Revenue",
    price: 300,
  ),
  Hotel(
    imageUrl: "assets/images/hotel2.jpg",
    name: "Hotel 2",
    address: "Manzukich rock vally,New Gordon",
    price: 240,
  ),

];