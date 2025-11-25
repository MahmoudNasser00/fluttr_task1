import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool showImage = false;
  final GlobalKey<CurvedNavigationBarState> _navKey = GlobalKey();

  final List<Widget> _pages = [
    const Center(child: Text('Home', style: TextStyle(fontSize: 28))),
    const Center(child: Text('Search', style: TextStyle(fontSize: 28))),
    const Center(child: Text('Favorites', style: TextStyle(fontSize: 28))),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 28))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: Colors.indigo,
        title: const Text('Task 1'),
        centerTitle: true,
        actions: [Icon(Icons.search, color: Colors.white)],
      ),

      body: showImage
          ? Center(
              child: Image.asset("assets/images/test.png", fit: BoxFit.contain),
            )
          : IndexedStack(index: _currentIndex, children: _pages),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showImage = true;
          });
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: CurvedNavigationBar(
        key: _navKey,
        index: _currentIndex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        color: Colors.indigo,
        buttonBackgroundColor: Colors.indigo,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 350),

        onTap: (index) {
          setState(() {
            _currentIndex = index;
            showImage = false;
          });
        },
      ),
    );
  }
}
