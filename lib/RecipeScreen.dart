import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

Widget recipe(String image,String text,String  link,String link2){


  return Scaffold(
      backgroundColor: Color(0xffffffff).withOpacity(0),
      body:  Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),

            ),
          ),
          width: double.infinity,
          child:
  SingleChildScrollView(
  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    height: 5,
                    width: 60,
                decoration: const BoxDecoration(
                color: Color(0xff506169),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
        ),
                ),
                SizedBox(height: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          // photo
                          child: Container(
                              height: 250,
                              width: 350,

                              decoration: BoxDecoration(

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child:
                              Container(
                                child:  Image.asset("${image}",
                                  fit: BoxFit.cover,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              )

                            // Container(
                            //
                            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
                            //
                            //
                            //   child: Image.asset("${image}",
                            //     fit: BoxFit.fitWidth,
                            //   ),
                            // )
                          ),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),),
                      //const SizedBox(width: 10,),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //video
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
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child:  Text("Recipe Video :", style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ),
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
                          width: 300,
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Another video',style: TextStyle(color: Colors.white,fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xfff94a0c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),
      )
  );
}