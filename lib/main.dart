import 'package:flutter/material.dart';
import 'package:widget_tutorial/page/first_page.dart';
import 'package:widget_tutorial/page/second_page.dart';
import 'package:widget_tutorial/page/third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Tab 1',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(Icons.star),
              ),
              Tab(
                text: 'Tab 3',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
      ),
    );
  }
}
