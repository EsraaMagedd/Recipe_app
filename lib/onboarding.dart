import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/signUpIn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          //color: Color.fromARGB(255, 255, 82, 82),
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                height: 325,
                child: PageView(
                    controller: _controller,
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Text( "Enjoy cooking", style: TextStyle(
                                fontSize: 65,
                                color: Color(0xfff94a0c),
                                height: 1,
                                //fontWeight: FontWeight.bold,
                                fontFamily: "times new roman"
                            ),),

                            SizedBox(height: 10,),
                            Text("Delicious and detailed restaurant recipes on your phone", style: TextStyle(
                              fontSize: 20,
                              height: 1,
                              color: Color(0xfff94a0c).withOpacity(.4),
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Text( "Get new experience", style: TextStyle(
                                fontSize: 65,
                                color: Color(0xfff94a0c),
                                height: 1,
                                //fontWeight: FontWeight.bold,
                                fontFamily: "times new roman"
                            ),),

                            SizedBox(height: 10,),
                            Text("You will get a new experience here, Wish you a nice time", style: TextStyle(
                              fontSize: 20,
                              height: 1,
                              color: Color(0xfff94a0c),
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),]
                ),
              ),

              Container(
                width: double.infinity,
                height: 350,
                //decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(10)),
                child: PageView(
                  controller: _controller,
                  children: [
                    Container(child:Image(image: AssetImage("images/onboarding1.png"),fit:BoxFit.fill)
                    ),
                    Container(
                        child:Image(image: AssetImage("images/onboarding2.png"),fit:BoxFit.scaleDown)

                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25,),
                  SmoothPageIndicator(controller: _controller!, count: 2,effect: ExpandingDotsEffect(dotColor: Colors.white,activeDotColor: Colors.white,dotHeight: 13),),
                ],
              ),
              SizedBox(height: 45,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => ProjectSignUp()));}
                ,
                child: Container(
                  alignment: Alignment.center,
                  height: 65,
                  width: 325,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(40),color: Color(0xfff94a0c)
                  ) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("  Get Started", style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(width: 25,),
                      //Icon(Icons.arrow_forward,color: Color.fromARGB(255, 255, 82, 82),)
                    ],
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
