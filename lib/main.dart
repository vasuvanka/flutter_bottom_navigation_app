import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _label = Constants.labels[0];
  final List<Widget> _children = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
            _label = Constants.labels[i];
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: Constants.labels[Constants.home]),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: Constants.labels[Constants.search]),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: Constants.labels[Constants.wishlist]),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: Constants.labels[Constants.profile]),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_label',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
