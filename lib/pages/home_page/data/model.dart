import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  final String name;
  final double price;
  final String description;
  final List image;

  Model({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
}
