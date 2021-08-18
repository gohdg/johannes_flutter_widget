import 'package:flutter/material.dart';
import 'package:widget_tutorial/widget/heart_animation_widget.dart';

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isHeartAnimating = false;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildImage(),
        buildActions(),
      ],
    );
  }

  Widget buildImage() {
    return GestureDetector(
      child: Stack(alignment: Alignment.center, children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            'https://images.unsplash.com/photo-1488716820095-cbe80883c496?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
            fit: BoxFit.cover,
          ),
        ),
        Opacity(
          opacity: isHeartAnimating ? 1 : 0,
          child: HearAnimationWidget(
            isAnimating: isHeartAnimating,
            duration: Duration(milliseconds: 700),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 100,
            ),
            onEnd: () {
              setState(() {
                isHeartAnimating = false;
              });
            },
          ),
        ),
      ]),
      onDoubleTap: () {
        setState(() {
          isHeartAnimating = true;
          isLiked = true;
        });
      },
    );
  }

  Widget buildActions() {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final color = isLiked ? Colors.red : Colors.white;

    return Container(
      child: Row(
        children: [
          HearAnimationWidget(
            alwaysAnimate:true,
            isAnimating: isLiked,
            
            child: IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
