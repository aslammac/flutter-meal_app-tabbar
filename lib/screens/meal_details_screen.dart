import 'package:flutter/material.dart';
//models
import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final mealItem = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: Container(),
    );
  }
}
