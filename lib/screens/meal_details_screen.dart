import 'package:flutter/material.dart';
//models
import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFavourite;
  final Function isMealFavourite;

  MealDetails(this.toggleFavourite, this.isMealFavourite);

  Widget headText(String titleText) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget listViewContainer(List<String> list) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(15)),
      height: 280,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(list[index]),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  Widget listViewText(List<String> list) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Colors.black12,
          )),
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerRight,
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          return Text(
            list[index],
            style: TextStyle(
              fontSize: 15,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealItem = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: isMealFavourite(mealItem.id)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
        elevation: 0,
        backgroundColor: Colors.amber,
        onPressed: () => toggleFavourite(mealItem.id),
      ),
      appBar: AppBar(
        title: Text(
          mealItem.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
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
                          height: 150,
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
                            Text(mealItem.affordability
                                .toString()
                                .substring(14)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.apps),
                            SizedBox(
                              width: 6,
                            ),
                            Text(mealItem.complexity.toString().substring(11)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            headText('Ingredients'),
            listViewText(mealItem.ingredients),
            headText('Steps'),
            listViewContainer(mealItem.steps)
          ],
        ),
      ),
    );
  }
}
