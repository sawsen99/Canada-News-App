import 'package:flutter/material.dart';
import 'package:newsapp/models/nav_menue.dart';
import 'package:newsapp/screens/headline_news.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/twitter_feed.dart';
import 'package:newsapp/screens/instagram_feed.dart';
import 'package:newsapp/screens/facebook_feeds.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenueItem> navigationMenu = [
    NavMenueItem("Explore", () => HomeScreen()),
    NavMenueItem("Headline News", () => HeadLineNews()),
    NavMenueItem("Twitter Feeds", () => TwitterFeed()),
    NavMenueItem("Instagram Feeds", () => InstagramFeed()),
    NavMenueItem("Facebook Feeds", () => FacebookFeeds())
  ];
  List<String> navMenu = [
    'Explore',
    'Headline News',
    'Read Later',
    'Videos',
    'Photos',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 65, left: 24),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade500,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          navigationMenu[position].destination(),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
