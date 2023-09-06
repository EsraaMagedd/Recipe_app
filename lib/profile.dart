import 'package:flutter/material.dart';
import 'package:home_screen/page2.dart';


class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 370,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/1.jpg"),
                              fit: BoxFit.cover)),
                      width: 400,
                      height: 300,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            maxRadius: 80,
                            backgroundImage: NetworkImage(
                                scale: 2.0,
                                "https://imgv3.fotor.com/images/gallery/AI-3D-Female-Profile-Picture.jpg"),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                                color: Color(0xfff94a0c),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name.';
                    } else if (value.length > 30) {
                      return 'Name should be less than 5 characters.';
                    }
                    return null; // Return null for no validation errors
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    icon: Icon(Icons.person, color: Colors.black54),
                    hintText: 'User Name ',
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number.';
                    } else if (value.length != 11) {
                      return 'Phone number should be exactly 11 characters.';
                    }
                    return null; // Return null for no validation errors
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    icon: Icon(Icons.phone, color: Colors.black54),
                    hintText: 'phone  ',
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    icon: Icon(Icons.location_on, color: Colors.black54),
                    hintText: 'location ',
                    labelText: 'location',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Page2()),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff94a0c),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    height: 60,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}