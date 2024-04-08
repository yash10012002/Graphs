import 'package:flutter/material.dart';

class ModelGraph {
  String title;
  String image;
  Color color;
  Widget widget;

  ModelGraph(
      {required this.title,
      required this.color,
      required this.image,
      required this.widget});
}
