import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(color: Colors.black, fontSize: 40,fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.nightlight_round, color: Colors.black54),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Stack(
              children: [
                const CircleAvatar(
                  maxRadius: 80,
                  backgroundImage:AssetImage("images/girl.PNG")
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      color: Colors.grey.withOpacity(0.5),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Reem Mohamed",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "01201388013",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            const Center(
              child: Text(
                "reemmmohamed41@gmail.com",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
           Divider(thickness: 1,
           color: Colors.grey,),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      "https://th.bing.com/th/id/OIP.hGaetDAQWapgIJbIOhPhXwHaHa?w=204&h=204&c=7&r=0&o=5&pid=1.7",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "data:image/jpeg;base64,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"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "data:image/jpeg;base64,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"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            

          ],
        ),
      ),
    );
  }
}