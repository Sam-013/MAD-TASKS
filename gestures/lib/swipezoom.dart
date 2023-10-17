import 'package:flutter/material.dart';

class SwipeImages extends StatelessWidget {
  final List<String> images = [
    "https://images.pexels.com/photos/4488636/pexels-photo-4488636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/8108084/pexels-photo-8108084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2246789/pexels-photo-2246789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1662159/pexels-photo-1662159.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/4666751/pexels-photo-4666751.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

   SwipeImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: InteractiveViewer(
        child:Center(
          child: SizedBox.fromSize(
        size: const Size.fromHeight(700.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 1.0),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0,
              ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
            );
          },
        ),
      )),
      ),
    );
  }
}