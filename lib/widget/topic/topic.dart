import 'package:flutter/material.dart';

import '../carousel/carousel.dart';

class Topic extends StatelessWidget {
  final String title;
  final Widget moreScreen;

  const Topic({super.key, required this.title, required this.moreScreen});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 43,
        child:  const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Anime',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Tất cả',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      Carousel()
    ]);
  }
}
