import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  InstagramFeed({Key? key}) : super(key: key);

  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insagram Feeds"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawHeader(),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/cd.jpg"),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              color: Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-7, 0),
              child: Text(
                "25",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: Text(
        "We also talk about the future of work as the robots",
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Wrap(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              '#advance',
              style: _hashTagStyle,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '#retro',
              style: _hashTagStyle,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '#instagram',
              style: _hashTagStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: ExactAssetImage("assets/images/bs.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                '10 COMMENTS',
                style: _hashTagStyle,
              )),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'SHARE',
                    style: _hashTagStyle,
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'OPEN',
                    style: _hashTagStyle,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
