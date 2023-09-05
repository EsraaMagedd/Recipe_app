import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/dessert.dart';
import 'package:home_screen/drinks.dart';
import 'RecipeScreen.dart';



int currentIndex=0;
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor:Color.fromARGB(255, 255, 82, 82),
              icon: Icon(Icons.home,color: Colors.white,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.white),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Colors.white),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.white),
              label: '',
            ),
          ],
        ),
        body:TabBarView(children: [
          SingleChildScrollView(
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
                            color: Color.fromARGB(255, 255, 82, 82),

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
                        color: Color.fromARGB(255, 255, 82, 82),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),),
                    Tab(child: Text('Dessert',style: TextStyle(
                        color: Color.fromARGB(255, 255, 82, 82),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),)),
                    Tab(child: Text('Drinks',style: TextStyle(
                        color: Color.fromARGB(255, 255, 82, 82),
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
                      width: 372,
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
         Container(
           width: double.infinity,
           height: double.infinity,
           child: dessert(),
         ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: drinks(),
          )
        ]),
   


      ),
    );
  }
}

class data{
  String? name;
  String? image;
  String? image2;
  Widget screen;

  data({this.name ,this.image,this.image2,required this.screen});

}
class data2{

  String? image2;
  data2({this.image2});

}
List <data2> l2=[
  data2(
      image2: 'images/c7.PNG'
  ),
  data2(
      image2: 'images/c6.PNG'
  ),
  data2(
      image2: 'images/c3.PNG'
  ),
  data2(
      image2: 'images/c5.PNG'
  )
];
List<data> l1=[

  data(
      name: "Pizza",
      image: 'images/pizza.jpg',
    screen: recipe("images/pizza.jpg",
      '''
- A cup and a quarter of water
- Half a small spoon of salt
- Half a spoon of yeast
- A teaspoon of white honey
- Three and a third cup of flour from 420 to 450''',
      "https://www.youtube.com/watch?v=hfh9hsJkUYc",)

  ),
  data(
      name: "Red Pasta",
      image: 'images/Red_Pasta.png',
    screen: recipe("images/Red_Pasta.png",
      '''
- 4 cups of red tomato juice
- Salt-pepper
- Two tablespoons of cumin
- 4 tablespoons vinegar
- Grated onion, squeezed without juice
- A quarter cup of oil''',
      "https://www.youtube.com/watch?v=0aUPHu4YDPE",),
  ),
  data(
      name: "Koushari",
      image: 'images/kushari.png',
    screen: recipe("images/kushari.png",
        '''
- Half a kilo of Egyptian rice
- A quarter kilo of lentils
- A quarter kilo of vermicelli
- Spices (salt, black pepper, cumin)
- Vegetable stock cube (optional)''',
        "https://www.youtube.com/watch?v=RX6k_VjkM1M"),
  ),
  data(
      name: "grape leaves",
      image: 'images/grape_leaves.png',
    screen: recipe("images/grape_leaves.png",
        '''
- Half a kilo of Egyptian rice, washed, not soaked, and well drained
- Half a kilo of tomato juice
- Half a cup of oil
- 3 tablespoons of ghee
- 2 tablespoons health sauce
- Spices''',
        "https://www.youtube.com/watch?v=Xt2dc9Mevyc"),
  ),
  data(
      name:  "mulukhiyah",
      image: 'images/mulukhiyah.png',
    screen: recipe("images/mulukhiyah.png",
        '''
- A frozen molokhia
- Two cups of soup
- 6 large tomato cloves
- A tablespoon of dried coriander
- Stock cube
- A sprinkle of sugar
- salt''',
        "https://www.youtube.com/watch?v=lQGdUrrNcKo"),
  ),
  data(
      name: "Pasta with bechamel",
      image:  'images/bechamel.png',
    screen: recipe("images/bechamel.png",
        '''
- A teaspoon of butter or ghee
- A small chopped onion
- 2 cloves of minced garlic
- 2 chopped tomatoes, peeled or grated
- 1 teaspoon tomato sauce
- Teaspoon salt
- quarter tea spoon of black Peper
- A quarter teaspoon of seven spices (optional)''',
        "https://www.youtube.com/watch?v=JfRetm14Mso"),
  ),
  data(
      name: "Stuffed cabbage",
      image: 'images/cabbage.png',
    screen: recipe("images/cabbage.png",
        '''
- Half a kilo of unfiltered peeled tomato juice
- 4 medium onions
- Half a cup of oil
- A tablespoon of ghee or butter
- A teaspoon of cumin/dry coriander/salt
- A teaspoon of sugar
- Half a teaspoon of black pepper''',
        "https://www.youtube.com/watch?v=lTMB6O2v6cg"),
  ),
  data(
      name: "Vermicelli rice",
      image: 'images/rice.png',
    screen: recipe("images/rice.png",
        '''
- A cup of noodles
- 3 cups of rice
- 3 cups of water
- salt''',
        "https://www.youtube.com/watch?v=G39FQ6V7tic"),
  ),
  data(
      name: "Shawarma",
      image: 'images/Shawarma.png',
    screen: recipe("images/Shawarma.png",
        '''
- One kilo of boneless chicken, cut into fingers
- 3/4 cup yogurt
- 1/2 cup oil
- 1/2 cup orange juice
- 1 tablespoon minced garlic
- Lemon juice
''',
        "https://www.youtube.com/watch?v=8JMqIHRKx1s"),
  ),
  data(
      name: "grilled meet",
      image: 'images/meat.png',
    screen: recipe("images/meat.png",
       '''
- A piece of steak
- Salt and black pepper
- 3 tablespoons butter
- Two cloves of garlic''',
        "https://www.youtube.com/watch?v=AGqrbf86WGk"),
  ),
  data(
      name: "Grilled chicken",
      image:  'images/chicken.png',
    screen: recipe("images/chicken.png",
        '''
- tomatoes
- onion
- Bell pepper
- 4 garlic cloves
- Salt-pepper
- A small spoon of paprika
- A large spoon of coriander''',
        "https://www.youtube.com/watch?v=gGfTjFGJak4"),
  ),
  data(
      name: "Grilled fish",
      image: 'images/fish.png',
    screen: recipe("images/fish.png",
        '''
- fish
- carrot
- tomatoes
- celery
- onion
- Tom, green and red pepper
- A tablespoon of dried coriander''',
        "https://www.youtube.com/watch?v=jEpxIoA9hC0"),
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
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context, builder:
                          (context)=>d.screen);},
                      child: Text('Start doing'),
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
