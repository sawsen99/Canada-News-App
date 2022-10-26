import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pagemodel.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages = <PageModel>[];

  int _currentIndex = 0;
  void _addPages() {
    pages.add(PageModel("Technology", Icons.ac_unit, 'assets/images/bg.jpg'));
    pages.add(PageModel("Science", Icons.map, 'assets/images/cc.jpg'));
    pages.add(PageModel("Sport", Icons.flag, 'assets/images/cd.jpg'));
    pages.add(PageModel("Entertainment", Icons.print, 'assets/images/bb.jpg'));
  }

  @override
  void initState() {
    super.initState();
    _addPages();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(pages[index].images),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -100),
                        child: Icon(
                          pages[index].icons,
                          size: 130,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        pages[index].titles,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 18),
                        child: Text(
                          "Making friends is easy as waving your hand back and forth in easy step",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              print(_currentIndex);
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 150),
          child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _drawPageIndicators(context),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 13, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent[700],
                ),
                onPressed: () {
                  print("i am pressed");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        _updateSeen();
                        return HomeScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white, fontSize: 17, letterSpacing: 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _drawPageIndicators(BuildContext context) {
    List<Widget> _widgets = [];
    for (var i = 0; i < pages.length; i++) {
      _widgets.add(_drawCircle(_currentIndex == i ? Colors.red : Colors.white));
    }
    return _widgets;
  }

  Widget _drawCircle(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      width: 13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
