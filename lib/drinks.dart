import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


int currentIndex=0;

class drinks extends StatefulWidget {
  const drinks({Key? key}) : super(key: key);

  @override
  State<drinks> createState() => _drinksState();
}

class _drinksState extends State<drinks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("All recipes for you",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,

                      ),),
                      Text("Choose what you want ..",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xfff94a0c),

                      ),)
                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [

                    Icon(Icons.search,color: Colors.black,),
                    Text("Search",style: TextStyle(
                        color: Colors.black45
                    ),)
                  ],
                ),
              ),
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            SizedBox(height: 20,),
            TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color:Colors.grey.withOpacity(0.3)), //Change background color from here
              tabs: [
                Tab(child: Text('Food',style: TextStyle(
                    color: Color(0xfff94a0c),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),),
                Tab(child: Text('Dessert',style: TextStyle(
                    color: Color(0xfff94a0c),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),)),
                Tab(child: Text('Drinks',style: TextStyle(
                    color: Color(0xfff94a0c),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),)),
              ],
            ),

            Container(
              height: 260,
              margin: EdgeInsets.all(5),
              child: ListView(
                children: [
                  CarouselSlider.builder(
                    itemCount:l2.length ,
                    itemBuilder: (context,int itemIndex,int pageIndex){
                      return slider(l2[itemIndex],context);
                    },
                    options: CarouselOptions(
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      onPageChanged: (index,reason){
                        setState((){
                          currentIndex=index;
                        });
                      },

                    ),),

                ],
              ),
            ),
            // SizedBox(height: 100,),
            Row(
              children: [
                SizedBox(height: 100,),
                Container(
                  width: 411,
                  height: 600,
                  // margin: EdgeInsets.all(10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=> items(l1[index],context),
                    //separatorBuilder: (context,index)=>SizedBox(height: 20,)
                    itemCount: l1.length,
                  ),
                  decoration: BoxDecoration(
                    //   color: Colors.brown
                  ),

                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}


class data{
  String? name;
  String? image;


  data({this.name ,this.image});

}
class data2{

  String? image2;
  data2({this.image2});

}
List <data2> l2=[
  data2(
      image2: 'images/dr1.PNG'
  ),
  data2(
      image2: 'images/dr2.PNG'
  ),
  data2(
      image2: 'images/dr3.PNG'
  ),
  data2(
      image2: 'images/dr4.PNG'
  )
];
List<data> l1=[

  data(
      name: "Iced coffee",
      image: 'images/dr5.PNG'

  ),
  data(
      name: "Orange juice",
      image: 'images/dr6.PNG'
  ),
  data(
      name: "Milkshake",
      image: 'images/dr7.PNG'
  ),
  data(
      name: "Lemon mint",
      image: 'images/dr8.PNG'
  ),
  data(
      name:  "Cocktail juice",
      image: 'images/dr9.PNG'
  ),
  data(
      name: "watermelon juice",
      image:  'images/dr10.PNG'
  ),
  data(
      name: "Roselle",
      image: 'images/dr11.PNG'
  ),


];
Widget items(data d,BuildContext context){
  return Center(
    child: Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50,),
        Stack(

          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 290,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),

                ),
              ),
            ),
            Positioned(
              top: -50,
              child:
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        //spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(width: 4,color: Colors.white)
                ),
                child: Container(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('${d.image}'),
                  ),
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(height: 150,),
                Text("${d.name}",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Start doing',style: TextStyle(color: Colors.white,fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 82, 82),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Icon(Icons.favorite_border,color: Colors.red,),
                  ],
                )

              ],
            )

          ],
        ),
      ],
    ),
  ) ;
}
Widget slider(data2 d2,BuildContext context){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('${d2.image2}', fit: BoxFit.fill,),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0,5)
                )
              ]
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20,bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin:Alignment.bottomCenter ,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.grey.withOpacity(0.3),
                    Colors.black12,
                    Colors.transparent,
                  ]
              )
          ),

        )
      ],
    ),
  );
}
