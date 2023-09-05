import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class RecipeScreen extends StatefulWidget{
  const RecipeScreen({super.key});
  @override
  State<RecipeScreen> createState()=>_RecipeScreen();

}

class _RecipeScreen extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();

  }
}
Widget recipe(String image,String text,String  link){
  return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: 550,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 5,
                  width: 60,
                  color: Color(0xff506169).withOpacity(0.99)
              ),
              SizedBox(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 250,
                          width: 450,

                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset("${image}",
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff94a0c),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child:  Text("Ingredients:", style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(.0),
                child: Row(

                  children: [
                    Text('''${text}''', style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),),
                    const SizedBox(width: 10,),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff94a0c),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child:  Text("Recipe video :", style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () => launch("${link}"),
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 250,
                        width: 450,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("${image}"),
                            fit: BoxFit.cover,
                          ),
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
                      top: 80,
                      child:
                      Container(
                        height: 100,
                        width: 100,
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
                          //border: Border.all(width: 4,color: Colors.black)
                        ),
                        child: Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/youtube2.png"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      )
  );
}

class Rdata{
  String? image;
  String? text;
  String? link;

  Rdata({this.image,this.text,this.link});

}
List<Rdata> dlist=[

  Rdata(
    image:"images/pizza",
    text:'''
- A cup and a quarter of water
- Half a small spoon of salt
- Half a spoon of yeast
- A teaspoon of white honey
- Three and a third cup of flour from 420 to 450''',
    link:"https://www.youtube.com/watch?v=hfh9hsJkUYc",
  ),
  Rdata(
    image:"images/Red_Pasta",
    text:'''
- 4 cups of red tomato juice
- Salt-pepper
- Two tablespoons of cumin
- 4 tablespoons vinegar
- Grated onion, squeezed without juice
- A quarter cup of oil''',
    link:"https://www.youtube.com/watch?v=0aUPHu4YDPE",
  ),
  Rdata(
    image:"images/kushari",
    text:'''
- Half a kilo of Egyptian rice
- A quarter kilo of lentils
- A quarter kilo of vermicelli
- Spices (salt, black pepper, cumin)
- Vegetable stock cube (optional)''',
    link:"https://www.youtube.com/watch?v=RX6k_VjkM1M",
  ),
  Rdata(
    image:"images/grape_leaves",
    text:'''
- Half a kilo of Egyptian rice, washed, not soaked, and well drained
- Half a kilo of tomato juice
- Half a cup of oil
- 3 tablespoons of ghee
- 2 tablespoons health sauce
- Spices''',
    link:"https://www.youtube.com/watch?v=Xt2dc9Mevyc",
  ),
  Rdata(
    image:"images/mulukhiyah",
    text:'''
- A frozen molokhia
- Two cups of soup
- 6 large tomato cloves
- A tablespoon of dried coriander
- Stock cube
- A sprinkle of sugar
- salt''',
    link:"https://www.youtube.com/watch?v=lQGdUrrNcKo",
  ),
  Rdata(
    image:"images/bechamel",
    text:'''
- A teaspoon of butter or ghee
- A small chopped onion
- 2 cloves of minced garlic
- 2 chopped tomatoes, peeled or grated
- 1 teaspoon tomato sauce
- Teaspoon salt
- quarter tea spoon of black Peper
- A quarter teaspoon of seven spices (optional)''',
    link:"https://www.youtube.com/watch?v=JfRetm14Mso",
  ),
  Rdata(
    image:"images/cabbage",
    text:'''
- Half a kilo of unfiltered peeled tomato juice
- 4 medium onions
- Half a cup of oil
- A tablespoon of ghee or butter
- A teaspoon of cumin/dry coriander/salt
- A teaspoon of sugar
- Half a teaspoon of black pepper''',
    link:"https://www.youtube.com/watch?v=lTMB6O2v6cg",
  ),
  Rdata(
    image:"images/rice",
    text:'''
- A cup of noodles
- 3 cups of rice
- 3 cups of water
- salt''',
    link:"https://www.youtube.com/watch?v=G39FQ6V7tic",
  ),
  Rdata(
    image:"images/Shawarma",
    text:'''
- One kilo of boneless chicken, cut into fingers
- 3/4 cup yogurt
- 1/2 cup oil
- 1/2 cup orange juice
- 1 tablespoon minced garlic
- Lemon juice
''',
    link:"https://www.youtube.com/watch?v=8JMqIHRKx1s",
  ),
  Rdata(
    image:"images/meat",
    text:'''
- A piece of steak
- Salt and black pepper
- 3 tablespoons butter
- Two cloves of garlic''',
    link:"https://www.youtube.com/watch?v=AGqrbf86WGk",
  ),
  Rdata(
    image:"images/chicken",
    text:'''
- tomatoes
- onion
- Bell pepper
- 4 garlic cloves
- Salt-pepper
- A small spoon of paprika
- A large spoon of coriander''',
    link:"https://www.youtube.com/watch?v=gGfTjFGJak4",
  ),
  Rdata(
    image:"images/fish",
    text:'''
- fish
- carrot
- tomatoes
- celery
- onion
- Tom, green and red pepper
- A tablespoon of dried coriander''',
    link:"https://www.youtube.com/watch?v=jEpxIoA9hC0",
  ),

];


