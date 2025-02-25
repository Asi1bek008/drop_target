import 'dart:math';

import 'package:drop_target/model/Content.dart';

class Global {
  static List<Content> list = [];
  static String image = '';
  static String currentGame = '';

  static List<Content> animals = [
    Content(image: 'assets/hayvonlar/cow.png', value: 'Cow', isDropped: false),
    Content(image: 'assets/hayvonlar/deer.png', value: 'Deer', isDropped: false),
    Content(image: 'assets/hayvonlar/fil.png', value: 'Elephant', isDropped: false),
    Content(image: 'assets/hayvonlar/ot.png', value: 'Horse', isDropped: false),
    Content(image: 'assets/hayvonlar/sher.png', value: 'Lion', isDropped: false),
  ];

  static List<Content> fruits = [
    Content(image: 'assets/mevalar/banan.png', value: 'Banana', isDropped: false),
    Content(image: 'assets/mevalar/kiwi.png', value: 'Kiwi', isDropped: false),
    Content(image: 'assets/mevalar/olma.png', value: 'Apple', isDropped: false),
    Content(image: 'assets/mevalar/qulupnay.png', value: 'Strawberry', isDropped: false),
    Content(image: 'assets/mevalar/uzum.png', value: 'Grape', isDropped: false),
  ];

  static List<Content> number = [
    Content(image: 'assets/raqamlar/1.png', value: 'One', isDropped: false),
    Content(image: 'assets/raqamlar/2.png', value: 'Two', isDropped: false),
    Content(image: 'assets/raqamlar/3.png', value: 'Three', isDropped: false),
    Content(image: 'assets/raqamlar/4.png', value: 'Four', isDropped: false),
    Content(image: 'assets/raqamlar/5.png', value: 'Five', isDropped: false),
  ];
}
