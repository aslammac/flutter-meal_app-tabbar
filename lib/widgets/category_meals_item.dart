import 'package:flutter/material.dart';
//models
import '../models/meal.dart';
//screens
import '../screens/meal_details_screen.dart';

class CategoryMealsItem extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String title;
  final Meal mealItem;
  CategoryMealsItem(this.mealItem);

  String get affordabilityText {
    switch (mealItem.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return '';
    }
  }

  String get complexityText {
    switch (mealItem.complexity) {
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      default:
        return '';
    }
  }

  void mealDetails(BuildContext cxt) {
    Navigator.of(cxt).pushNamed(
      MealDetails.routeName,
      arguments: mealItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealDetails(context),
      splashColor: Colors.amber,
      // borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealItem.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      color: Colors.black54,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    width: 220,
                    child: Text(
                      mealItem.title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${mealItem.duration} min ')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.analytics),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.apps),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
