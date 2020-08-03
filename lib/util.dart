import 'package:flutter/material.dart';
import 'package:mood_tracking/expression_model.dart';

class Util {
  static final List<ExpressionModel> expressionList = [
    ExpressionModel(
        imagePath: "assets/svg/angry.svg",
        label: "ANGRY",
        backgroundColor: Colors.red),
    ExpressionModel(
        imagePath: "assets/svg/sad.svg",
        backgroundColor: Colors.grey,
        label: " SAD "),
    ExpressionModel(
        backgroundColor: Colors.orange,
        imagePath: "assets/svg/smiling.svg", label: "SMILING"),
    ExpressionModel(
      imagePath: "assets/svg/happy.svg",
      backgroundColor: Colors.amber.withOpacity(0.8),
      label: "HAPPY",
    ),
    ExpressionModel(
        imagePath: "assets/svg/great.svg",
        backgroundColor: Colors.pink,
        label: "GREAT"),
  ];
}
