import 'package:flutter/material.dart';

String img = "";
String img1 =
    "https://images.pexels.com/photos/4488636/pexels-photo-4488636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
String imgTap =
    "https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
String imgDoubleTap =
    "https://images.pexels.com/photos/4666751/pexels-photo-4666751.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
String txt = "";

class TapGes extends StatefulWidget {
  const TapGes({super.key});
  @override
  State<TapGes> createState() => _TapGesState();
}

class _TapGesState extends State<TapGes> {
  @override
  void initState() {
    super.initState();
    img = img1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tap Gestures",
              ),
      ),
      body: GestureDetector(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  txt,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                  ),
                Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ],
            )),
        onTapDown: (tap) {
          setState(() {
            img = img1;
            txt = "On Tap Down";
          });
        },
        onTap: () {
          setState(() {
            img = imgTap;
            txt = "On Tap";
          });
        },
        onDoubleTap: () {
          setState(() {
            img = imgDoubleTap;
            txt = "On Double Tap";
          });
        },
      ),
    );
  }
}
