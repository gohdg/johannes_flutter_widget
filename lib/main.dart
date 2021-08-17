import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final itemKey = GlobalKey();

  final itemController = ItemScrollController();
  final itemListener = ItemPositionsListener.create();

  Future scrollToItem() async {
    // final context = itemKey.currentContext!;
    // await Scrollable.ensureVisible(context,
    //     alignment:
    //         0.5, //scroll 시 아이템이 화면에 가운데에 위치하게 default는 이동시 최상단에 위치, 1은 최하단
    //     duration: Duration(seconds: 1));

    // itemController.jumpTo(
    //   index: 12,
    //   alignment: 0.5,
    // );

    itemController.scrollTo(
      index: 12,
      duration: Duration(seconds: 1),
    ); //alignment: 0.5);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    itemListener.itemPositions.addListener(() {
      final indices = itemListener.itemPositions.value
          .where((item) {
            final isTopVisible = item.itemLeadingEdge >= 0;
            final isBottomVisible = item.itemTrailingEdge <= 1;

            return isTopVisible && isBottomVisible;
          })
          .map((item) => item.index)
          .toList();
      print(indices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll to Item'),
        centerTitle: true,
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 50,
        itemBuilder: (context, index) => buildCard(index),
        itemScrollController: itemController,
        itemPositionsListener: itemListener,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: () {
          scrollToItem();
        },
      ),
    );
  }

  Widget buildCard(int index) {
    final isHighlighted = 12 == index;
    final color = isHighlighted ? Colors.green : Colors.white;
    final textColor = isHighlighted ? Colors.white : Colors.black;

    return Container(
      height: 100, //index % 2 == 0 ? 100 : 200,
      child: Card(
        color: color,
        child: Center(
          child: Text(
            'Item $index',
            style: TextStyle(fontSize: 28, color: textColor),
          ),
        ),
      ),
    );
  }
}
