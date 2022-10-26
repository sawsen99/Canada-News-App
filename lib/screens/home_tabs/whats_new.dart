//import 'dart:html';

import 'dart:ui';

import 'package:flutter/material.dart';

class Whats_new extends StatefulWidget {
  const Whats_new({Key? key}) : super(key: key);

  @override
  _Whats_newState createState() => _Whats_newState();
}

class _Whats_newState extends State<Whats_new> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          _drawTopStories(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.red,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.red,
      fontSize: 19,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage('assets/images/nw.jpg'),
        fit: BoxFit.cover,
      )),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 48, right: 48),
                child: Text(
                  "Discover the latest news that are happening in Canada today",
                  style: _headerTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34, right: 34),
                child: Text(
                  " Keep abreast of events in all fields",
                  style: _headerDescription,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: _drawSectionTitle("Top Stories")),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                  _drawDivider(),
                  _drawSingleRow(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8, top: 9),
                  child: _drawSectionTitle("Recent Update"),
                ),
                _drawRecentUpdates(Colors.deepOrange),
                _drawRecentUpdates(Colors.greenAccent),
                SizedBox(
                  height: 48,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        children: [
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/pc.jpg'),
              fit: BoxFit.cover,
            ),
            width: 125,
            height: 98,
          ),
          SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Happy news Happy news Happy news Happy news Happy news Happy news Happy newsHappy news Happy newsHappy news Happy news",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 31),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Michel Adams",
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            "15 min",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      "Top stories",
      style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
          fontSize: 17),
    );
  }

  Widget _drawRecentUpdates(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/tb.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 3, bottom: 3),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
              child: Text(
                'SPORT',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 8),
            child: Text("Vettel is Ferrari number One - Hamitton",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "15 min",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
