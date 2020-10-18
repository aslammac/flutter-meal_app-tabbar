import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';
//dummy data
import '../dummy_data.dart';
//models
import '../models/meal.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({this.id, this.title, this.color});
  // void selectedCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return CategoryMeals(
  //           id: id,
  //           title: title,
  //         );
  //       },
  //     ),
  //   );
  // }
  String get imageUrl {
    Meal url =
        dummy_meals.firstWhere((element) => element.categories.contains(id));
    return url.imageUrl;
  }

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: NetworkImage(
                imageUrl,
              ),
            )),
      ),
    );
  }
}
