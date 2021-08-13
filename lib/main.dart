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

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab ${controller.index + 1}'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
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
        controller: controller,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentIndex == controller.length - 1) {
            currentIndex = 0;
          } else {
            currentIndex += 1;
          }
          controller.animateTo(currentIndex);
          print('aaa');
        },
        child: Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
