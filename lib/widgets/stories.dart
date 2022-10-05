import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key, required this.name, required this.imageUrl})
      : super(key: key);
  final String name, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8, left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 38,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 34,
                  ),
                ),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }
}
