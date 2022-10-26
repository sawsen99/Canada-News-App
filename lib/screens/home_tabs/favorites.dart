import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.pink,
    Colors.brown,
    Colors.lightBlue,
    Colors.deepPurple,
    Colors.deepOrange
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/cc.jpg"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Micheal Adams",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "15 min",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Life Style",
                      style: TextStyle(color: _getRandomColor()),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark_border),
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/cd.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: 120,
          height: 120,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Tech Tents Old phones and safe social",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "We also talk about the future of work as the robots advents, amost people like to live with each other,nobody is alone today.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  height: 1.5,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
