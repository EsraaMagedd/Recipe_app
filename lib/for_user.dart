import 'package:flutter/material.dart';

import 'helper/hive_helper.dart';

class NoteScreen extends StatefulWidget{
  const NoteScreen({super.key});
  @override
  State<NoteScreen> createState()=>_NoteScreenState ();
}
class _NoteScreenState extends State<NoteScreen> {
  final noteContoroller = TextEditingController();

  @override
  void initState() {
    HiveHelper.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 82, 82),
        title: Text("Your recipies",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),),
        actions: [
          actionButton(icon: Icons.delete_forever,onTap: (){
            HiveHelper.notesList.clear();
            setState(() {
            });
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 82, 82),
        onPressed: () async {
          noteContoroller.clear();
          AlertDialog alert = AlertDialog(
            title: Text("Add your recipie ..",style: TextStyle(color: Colors.redAccent.withOpacity(0.6)),),
            content: TextFormField(
              controller: noteContoroller,
            ),
            actions: [
              TextButton(
                child: Text("Cancel",style: TextStyle(color: Colors.redAccent.withOpacity(0.6)),),
                onPressed:  () {
                  Navigator.pop(context);
                  setState(() {
                  });
                },
              ),
              TextButton(
                child: Text("Add",style: TextStyle(color: Colors.redAccent.withOpacity(0.6)),),
                onPressed:  () {
                  if(noteContoroller.text.isNotEmpty){
                   // HiveHelper.notesList.add(noteContoroller.text);
                    HiveHelper.addNote(noteContoroller.text);
                    Navigator.pop(context);
                    setState(() {

                    });
                  }
                },
              )
            ],
          );

          // show the dialog
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: HiveHelper.notesList.length,
          itemBuilder: (context, index)=>Stack(
            children: [
              InkWell(
                onTap: () async {
                  noteContoroller.text=HiveHelper.notesList[index];
                  AlertDialog alert = AlertDialog(
                    title: Text("Add your note ..",style: TextStyle(color: Colors.redAccent.withOpacity(0.6)),),
                    content: TextFormField(
                      controller: noteContoroller,
                    ),
                    actions: [
                      TextButton(
                        child: Text("Cancel",style: TextStyle(color: Colors.redAccent.withOpacity(0.6)),),
                        onPressed:  () {
                          Navigator.pop(context);
                          setState(() {
                          });
                        },
                      ),
                      TextButton(
                        child: Text("Continue",style: TextStyle(color: Colors.redAccent.withOpacity(0.6)),),
                        onPressed:  () {
                          if(noteContoroller.text.isNotEmpty){
                            HiveHelper.notesList[index]=(noteContoroller.text);
                            Navigator.pop(context);
                            setState(() {

                            });
                          }
                        },
                      )
                    ],
                  );
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 140,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                    ),
                  child: Center(
                    child: Text(
                      HiveHelper.notesList[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ),
              ),
              InkWell(
                onTap: (){
                  HiveHelper.notesList.removeAt(index);
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(Icons.dangerous,
                    color: Colors.black12,),
                ),
              )
            ],

          )
      ),
    );
  }
  Widget actionButton({required IconData icon,void Function()? onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
        padding: EdgeInsets.all(15),
        child: Icon(icon),
      ),
    );
  }
}