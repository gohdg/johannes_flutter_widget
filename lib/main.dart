import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Read More'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Awesome Article1',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          buildText(
              'Lorem,corrupti! Consequuntur, eum cum voluptates quas non quam fugiat beatae minus! Tenetur vero soluta quis dolore provident molestias laborum dolor, cupiditate aliquam, non exercitationem accusantium nostrum saepe possimus quidem! Enim dicta totam expedita excepturi nihil voluptatibus, minus at delectus modi porro incidunt dignissimos cupiditate doloremque optio, fugiat assumenda, quaerat hic. Ab iusto sint labore repudiandae alias quisquam est doloribus fuga tenetur excepturi magni sequi architecto temporibus, ullam nulla dolor accusantium reiciendis similique fugiat, commodi, rerum earum natus? Dolorum inventore in sapiente veritatis! Quisquam esse dolores nisi molestiae odit harum exercitationem rem sed! Ut voluptates, debitis blanditiis officiis totam quia in qui dolores perspiciatis veniam, reiciendis laboriosam labore adipisci. Molestiae temporibus rem magni accusantium excepturi earum amet repellendus quis dolor commodi quod et aspernatur quibusdam a omnis rerum veniam, corrupti fugiat beatae laboriosam eum sunt inventore facere dolorum. Illum, aliquam similique! Dign.'),
          SizedBox(
            height: 24,
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   child: buildButton(),
          // )
        ],
      ),
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isReadMore = !isReadMore;
        });
      },
      child: Text(isReadMore ? 'Read Less' : 'Read More'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        textStyle: TextStyle(fontSize: 20),
      ),
    );
  }

  // without readmore package
  // Widget buildText(String text) {
  //   final maxLines = isReadMore ? null : 5;
  //   final overflow = isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;
  //   return Text(
  //     text,
  //     maxLines: maxLines,
  //     overflow: overflow,
  //     style: TextStyle(fontSize: 28),
  //   );
  // }

  // with readmore package
  Widget buildText(String text) {
    final styleButton = TextStyle(
      fontSize: 20,
      color: Colors.pink,
      fontWeight: FontWeight.bold,
    );
    return ReadMoreText(
      text,
      trimLength: 200,
      trimMode: TrimMode.Length,
      // trimLines: 5,
      // trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More',
      trimExpandedText: 'Read Less',
      lessStyle: styleButton,
      moreStyle: styleButton,

      style: TextStyle(fontSize: 20),
    );
  }
}
