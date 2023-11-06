import 'package:flutter/material.dart';


class CarouselItem extends StatelessWidget {
  final String image;
  final String text;
  final Widget page;

  const CarouselItem(
      {required this.text, required this.image, required this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => page,
          ));
        },
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            // margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(12)),
                        color: Colors.white),
                    padding: EdgeInsets.all(8),
                    // color: Colors.white,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.black, // Màu chữ
                        fontWeight: FontWeight.bold, // Độ đậm của chữ
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
