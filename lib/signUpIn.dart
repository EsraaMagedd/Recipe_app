import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_screen/home.dart';
import 'package:home_screen/onboarding.dart';
import 'package:home_screen/screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'cubit/login_cubit.dart';
import 'cubit/sign_up_cubit.dart';
import 'custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProjectSignUp extends StatefulWidget {
  const ProjectSignUp({super.key});

  @override
  State<ProjectSignUp> createState() => _SignUp2State();
}

class _SignUp2State extends State<ProjectSignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final mykey = GlobalKey<FormState>();
  final mykey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    PageController _controller =PageController();
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(

          color: Color.fromRGBO(245, 245, 245, 1),
          child: Column(
            children: [

              Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(30),bottomLeft: Radius.circular(30)),color: Colors.white,),
                child: Column(
                  children: [
                    SizedBox(height: 150),
                    Container(
                        height: 150,
                        width: 150 ,
                        child: Image(image: AssetImage("images/logo.png"),fit:BoxFit.cover)),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Login",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),),
                        InkWell(
                          onTap: (){},
                          child: Text("Sign-up",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),),
                        ),

                      ],
                    ),
                    SizedBox(height: 5),
                    SmoothPageIndicator(controller: _controller, count: 2,effect: CustomizableEffect(dotDecoration: DotDecoration(height: 4,width: 160,color: Colors.white,borderRadius: BorderRadius.circular(2)),activeDotDecoration: DotDecoration(height: 4,width: 160,color: Color(0xfff94a0c),borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 568,
                child: PageView(
                    controller: _controller,
                    children:[
                      GestureDetector(
                        onTap: FocusScope
                            .of(context)
                            .unfocus,
                        child: Form(
                          key: mykey,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(right: 40,left: 40),
                            height: 568,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                SizedBox(height:40,),
                                CustomTextField(height: 40, text: "Name", controller: _nameController,isPassword: false,validator: (val){
                                  if(val!.length>=3){
                                    return null;
                                  }
                                  else{
                                    return "The name can't be less than four charachters";
                                  }
                                },),
                                SizedBox(height:25,),
                                CustomTextField(height: 40, text: "Email", controller: _emailController,isPassword: false, validator: (val) {

                                  bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val!);
                                  if(emailValid==false){
                                    return "That isn't a valid Email";
                                  }
                                  if (val.isEmpty) {
                                    return "The Field is empty";
                                  } else if (val.length < 11) {
                                    return "the numbers in less than 11 digits";
                                  }

                                  setState(() {
                                  });

                                }),
                                SizedBox(height:25,),
                                CustomTextField(height: 20, text: "Password", controller: _passwordController,isPassword: true),
                                SizedBox(height:55,),
                                BlocBuilder<LoginCubit, LoginState>(
                                  builder: (context, state) {
                                    if(state is LoginLoadingState){
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                    return InkWell(
                                      onTap: () {
                                        if (mykey.currentState!.validate()) {
                                          context.read<LoginCubit>().login(
                                            email: _emailController.text,
                                            password: _passwordController.text,);
                                            Get.offAll(pages());

                                        }
                                      },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: double.infinity,
                                            decoration:BoxDecoration(
                                                borderRadius:BorderRadius.circular(30),color: Color(0xfff94a0c)
                                            ) ,
                                            child: Text("Log In", style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          ),
                                        );
          },
                                  ),
                                SizedBox(width: 20,),


                              ],
                            ),

                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: FocusScope
                            .of(context)
                            .unfocus,
                        child: Form(
                          key: mykey2,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(right: 40,left: 40),
                            height: 568,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                SizedBox(height:40,),
                                CustomTextField(height: 40, text: "Name", controller: _nameController,isPassword: false,validator: (val){
                                  if(val!.length>=3){
                                    return null;
                                  }
                                  else{
                                    return "The name can't be less than four charachters";
                                  }
                                },),
                                SizedBox(height:25,),
                                CustomTextField(height: 40, text: "Email", controller: _emailController,isPassword: false, validator: (val) {

                                  bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val!);
                                  if(emailValid==false){
                                    return "That isn't a valid Email";
                                  }
                                  if (val.isEmpty) {
                                    return "The Field is empty";
                                  } else if (val.length < 11) {
                                    return "the numbers in less than 11 digits";
                                  }

                                  setState(() {
                                  });

                                }),
                                SizedBox(height:25,),
                                CustomTextField(height: 20, text: "Password", controller: _passwordController,isPassword: true),
                                SizedBox(height:55,),
                                BlocBuilder<SignUpCubit, SignUpState>(
                                  builder: (context, state) {
                                    if(state is SignUpLoadingState){
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                    return InkWell(
                                        onTap: () {
                                          _phoneController.text="01204433333";
                                          context.read<SignUpCubit>().signUp(
                                              email: _emailController.text,
                                              password: _passwordController.text,
                                              name: _nameController.text,
                                              phone: _phoneController.text,
                                              );
                                          Get.offAll(pages());
                                          },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          width: double.infinity,
                                          decoration:BoxDecoration(
                                              borderRadius:BorderRadius.circular(30),color: Color(0xfff94a0c)
                                          ) ,
                                          child: Text("Sign Up", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                      );
                                  },
                                ),
                                SizedBox(width: 20,),


                              ],
                            ),

                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ) ,
    )
    ;
  }
}
