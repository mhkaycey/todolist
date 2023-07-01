import 'package:flutter/material.dart';
import 'package:mytodo/core/color/color.dart';
import 'package:mytodo/core/icons/icons.dart';

List<Icon> getIcons() {
  return [
    const Icon(
      IconData(personIcon, fontFamily: 'MaterialIcons'),
      color: Colors.black,
    ),
    const Icon(
      IconData(workIcon, fontFamily: 'MaterialIcons'),
      color: Colors.pink,
    ),
    const Icon(
      IconData(movieIcon, fontFamily: 'MaterialIcons'),
      color: Colors.green,
    ),
    const Icon(
      IconData(sportIcon, fontFamily: 'MaterialIcons'),
      color: Colors.yellow,
    ),
    const Icon(
      IconData(travelIcon, fontFamily: 'MaterialIcons'),
      color: Colors.lightBlue,
    ),
    const Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'),
        color: bluishClr),
  ];
}
