import 'package:flutter/material.dart';

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
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dismiss Keyboard'),
          centerTitle: true,
        ),
        // body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        //   child: Column(children: [
        // TextField(
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(), labelText: 'Name'),
        // ),
        // SizedBox(
        //   height: 32,
        // ),
        // Text(
        //   'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat commodi molestiae consequuntur animi modi et vero quidem ex recusandae, perferendis amet qui quisquam dolor quas iure corrupti. Illo ab ratione, sint laboriosam dolor aut laborum excepturi iusto veritatis dolorem voluptates praesentium eveniet. Reiciendis exercitationem, esse officia praesentium explicabo odit ratione.',
        //   style: TextStyle(fontSize: 32),
        // )
        //   ]),
        // ),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat commodi molestiae consequuntur animi modi et vero quidem ex recusandae, perferendis amet qui quisquam dolor quas iure corrupti. Illo ab ratione, sint laboriosam dolor aut laborum excepturi iusto veritatis dolorem voluptates praesentium eveniet. Reiciendis exercitationem, esse officia praesentium explicabo odit ratione.',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
