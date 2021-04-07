import 'package:flutter/material.dart';
import 'package:headers/src/widget/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideShow(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.amber,
            ),
            Container(
              padding: EdgeInsets.all(30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
