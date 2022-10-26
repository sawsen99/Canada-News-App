import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  const TwitterFeed({Key? key}) : super(key: key);

  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
        centerTitle: false,
        backgroundColor: Colors.red[900],
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                children: [
                  _cardHeader(),
                  _cardBody(),
                  _drawLine(),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/images/cc.jpg"),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Christina Meyars",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "@ch_meyars",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              "Tue, 09 May 2021 * 14:30",
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      child: Text(
        "We also talk about the future of work as the robots advants, and we ask whether a retro phone. ",
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  size: 28,
                ),
                color: Colors.orange[700],
                onPressed: () {},
              ),
              Text(
                "25",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "SHARE",
                  style: TextStyle(color: Colors.orange.shade700),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "OPEN",
                  style: TextStyle(color: Colors.orange.shade700),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _drawLine() {
  return Container(
    height: 1,
    color: Colors.grey.shade300,
    margin: EdgeInsets.only(top: 15),
  );
}
