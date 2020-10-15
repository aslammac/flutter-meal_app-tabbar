import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_meals_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String id;
  // final String title;
  // CategoryMeals({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMealsItems = dummy_meals
        .where((element) => element.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CategoryMealsItem(categoryMealsItems[index]);
        },
        itemCount: categoryMealsItems.length,
      ),
    );
  }
}
