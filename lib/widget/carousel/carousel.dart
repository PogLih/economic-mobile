import 'package:economic/widget/carousel/carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../presentation/homePage/home_page.dart';


final List<String> imgList = [
  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx21-tXMN3Y20PIL9.jpg',
  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx145064-5fa4ZBbW4dqA.jpg',
  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx145064-5fa4ZBbW4dqA.jpg',
  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx145064-5fa4ZBbW4dqA.jpg',
  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx146065-1hTpwsW2fQIA.jpg',
  'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx159831-TxAC0ujoLTK6.png'
];

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 3,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        pageViewKey: PageStorageKey<String>('carousel_slider'),
        // enlargeCenterPage: true
      ),
      items: imgList
          .map(
            (item) => CarouselItem(text: 'truyen', image: item, page: HomePage())
          )
          .toList(),
    ));
  }
}
