import 'package:flutter/material.dart';
import 'package:newsapp/shared_ui/navigation_drawer.dart';
import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text("Explore"),
          backgroundColor: Colors.red[900],
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            _popOutMenu(context),
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
              Whats_new(),
              Popular(),
              Favorites(),
            ],
            controller: _tabController,
          ),
        ));
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('SETTINGS'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {},
      icon: Icon(Icons.more_vert),
    );
  }
}
