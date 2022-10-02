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
  List<Image> Newreleases = [
    Image.asset('assets/card_pics/2130.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/2452.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/3700_2_06.jpg', fit: BoxFit.fill),
    Image.asset('assets/card_pics/cont_1_07.jpg', fit: BoxFit.fill),
  ];
  List<String> newdescription = [
    'How much do you know about space?',
    'What about carbs?',
    '101 steps to being influencial',
    'Use 100% of your brain'
  ];
  List<double> ratings = [4.0, 3.5, 2.3, 4, 8];
}
