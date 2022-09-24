import 'package:flutter/material.dart';

class Carousel {
  List<Image> images = [
    Image.asset('assets/card_pics/cars.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/tri.png', fit: BoxFit.fill),
    Image.asset('assets/card_pics/Scene-19.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/1937.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/night.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/3655778.jpg', fit: BoxFit.fill)
  ];
  List<String> descriptions = [
    'Abstract Philosophy',
    'Advanced science fiction',
    'Plant science',
    'Development economics',
    'Astrology',
    'Organic chemistry'
  ];
}
