import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';

import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';

class HeadLineNews extends StatefulWidget {
  HeadLineNews({Key? key}) : super(key: key);

  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Headline News"),
          backgroundColor: Colors.red[900],
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "WHAT'S NEW",
              ),
              Tab(
                text: "POPULAR",
              ),
              Tab(
                text: "FAVORITED",
              ),
            ],
            controller: _tabController,
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              Favorites(),
              Popular(),
              Favorites(),
            ],
            controller: _tabController,
          ),
        ));
  }
}
