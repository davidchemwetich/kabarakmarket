import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Greeting {
  String _greet = '';

  String get greet => _greet;

  void setGreet() {
    var now = DateTime.now();
    var formatter = DateFormat('HH');
    int currentTime = int.parse(formatter.format(now));

    if (currentTime >= 5 && currentTime < 12) {
      _greet = 'Good morning🌤️';
    } else if (currentTime >= 12 && currentTime < 18) {
      _greet = 'Good afternoon🌇';
    } else {
      _greet = 'Good evening🌥🌙';
    }
  }

  Text greetSomeone(String name) {
    setGreet();
    return Text(
      "$_greet$name",
      style: const TextStyle(fontSize: 9, color: Colors.white),
    );
  }
}
