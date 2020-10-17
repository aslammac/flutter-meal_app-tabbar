import 'package:flutter/material.dart';
//models
import '../models/meal.dart';
//
import '../widgets/category_meals_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite-screen';
  final List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    return favouriteMeal.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return CategoryMealsItem(favouriteMeal[index]);
            },
            itemCount: favouriteMeal.length,
          )
        : Center(
            child: Text('No Favourite!!'),
          );
  }
}
