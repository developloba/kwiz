import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kwik/screens/quizinfo.dart';

import '../utils/carousel_manager.dart';

class Smallcarousel extends StatefulWidget {
  const Smallcarousel({
    super.key,
    required this.carouselmanager,
  });

  final Carousel carouselmanager;
  @override
  State<Smallcarousel> createState() => _SmallcarouselState();
}

class _SmallcarouselState extends State<Smallcarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.carouselmanager.genres.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Info()),
                    );
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: 220,
                  height: 200,
                  child: Card(
                    elevation: 0,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: widget.carouselmanager.genres[itemIndex],
                  ),
                )),
            Text(
              widget.carouselmanager.genre_description[itemIndex],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontFamily: 'Pop'),
            )
          ],
        );
      },
      options: CarouselOptions(
          viewportFraction: 0.4,
          autoPlay: false,
          enlargeCenterPage: false,
          pageSnapping: false,
          padEnds: false),
    );
  }
}

class Bigcarousel extends StatelessWidget {
  const Bigcarousel({
    Key? key,
    required this.carouselmamager,
  }) : super(key: key);

  final Carousel carouselmamager;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselmamager.images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return SizedBox(
          height: 430,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300,
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 400,
                      height: 250,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: carouselmamager.images[itemIndex],
                      ),
                    )),
              ),
              Expanded(
                child: Text(
                  carouselmamager.descriptions[itemIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontFamily: 'Pop'),
                ),
              )
            ],
          ),
        );
      },
      options: CarouselOptions(
          viewportFraction: 0.7,
          height: 420,
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: false,
          padEnds: false),
    );
  }
}
