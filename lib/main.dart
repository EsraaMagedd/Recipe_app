import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_screen/profile.dart';
import 'package:home_screen/screens.dart';
import 'package:home_screen/signUpIn.dart';
import 'RecipeScreen.dart';
import 'cubit/login_cubit.dart';
import 'cubit/sign_up_cubit.dart';
import 'helper/dio_helper.dart';
import 'splash.dart';
import 'helper/hive_helper.dart';
import 'home.dart';
import 'onboarding.dart';
import 'helper/hive_helper.dart';



void main() async  {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  await Hive.openBox(HiveHelper.myToken);
  DioHelper.init();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
