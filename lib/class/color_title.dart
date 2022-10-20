import 'package:flutter/material.dart';

class Colorlist {
  colortitle(int checkloop) {
    if (checkloop == 0) {
      var color = Color.fromRGBO(235, 235, 239, 1);
      return color;
    } else if (checkloop == 3) {
      var color = Colors.red;
      return color;
    } else {
      var color = Color.fromRGBO(250, 250, 250, 1);
      return color;
    }
  }
}