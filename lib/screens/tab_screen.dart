import 'package:flutter/material.dart';
import '../models/meal.dart';
//screens
import './categories_screen.dart';
import './favourite_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabbar-screen';
  final List<Meal> favouriteMeal;
  TabScreen(this.favouriteMeal);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Meals',
          ),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
              ),
              text: 'Category',
            ),
            Tab(
              icon: Icon(
                Icons.favorite_outline,
              ),
              text: 'Favourite',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavouriteScreen(widget.favouriteMeal),
        ]),
      ),
    );
  }
}
