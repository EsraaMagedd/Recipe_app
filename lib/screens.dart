import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_screen/profile.dart';

import 'home.dart';

class pages extends StatefulWidget {
  const pages({Key? key}) : super(key: key);

  @override
  State<pages> createState() => _pagesState();
}

class _pagesState extends State<pages> {
  final tabs=[
    MyHomePage(),
    Container(
      width: double.infinity,
      height: double.infinity,
      child: Text("serch"),
    ),

    Container(
      width: double.infinity,
      height: double.infinity,
      child: Page1(),
    ),
  ];
  int index2=0;
  void x1(int index){
    setState(() {
      index2=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (

      bottomNavigationBar: BottomNavigationBar(
        //unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        //selectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        onTap: x1,
        currentIndex: index2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xfff94a0c),
        unselectedFontSize: 20,


        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xfff94a0c),
            icon: Icon(Icons.home,color: Colors.white,size: 30),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border,color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person,color: Colors.white),

          ),
        ],

      ),
      body: tabs[index2],
    );
  }
}
