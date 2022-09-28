// ignore_for_file: non_constant_identifier_names

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
  List<Image> genres = [
    Image.asset('assets/card_pics/3655778.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/2385036.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/488.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/tri.png', fit: BoxFit.fill),
  ];
  List<String> genre_description = [
    'Chemistry',
    'Maths',
    'History',
    'Trivia',
  ];
  List<String> recommendations = [
    'Am I a llama?',
    'Science for nerds',
    'How much do you know about plants?'
  ];
  List<String> author = ['Mathew Steinberg', 'Alfredo', 'Efe Fitzelburger'];

  List<Image> recommendation_images = [
    Image.asset('assets/card_pics/3655778.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/2385036.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/Scene-19.jpg', fit: BoxFit.fill),
  ];
}
