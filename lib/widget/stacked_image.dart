import 'package:flutter/material.dart';

class StackedImage extends StatelessWidget {
  StackedImage({required this.imageUrl, required this.title,required this.radius, super.key});

  String imageUrl;
  String title;
  double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
          child: Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          width: 300,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: Theme.of(context).textTheme.headline6?.fontFamily,
                  fontSize: 30),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
