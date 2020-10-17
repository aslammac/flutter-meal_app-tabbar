import 'package:flutter/material.dart';

//screens
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tab_screen.dart';
import './screens/bottom_tabbar_screen.dart';
import './screens/filter_screen.dart';
import './screens/categories_screen.dart';
import './screens/favourite_screen.dart';
//models
import './models/category.dart';
import 'models/meal.dart';
//dummy data
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // static const routeName = '/';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Category> dummyCategories = dummy_categories.toList();

  List<Meal> _availableMeals = dummy_meals;

  List<Meal> _favouriteMeal = [];

  bool isMealFavourite(String mealId) {
    return _favouriteMeal.any((element) => element.id == mealId);
  }

  void toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeal.indexWhere((element) => element.id == mealId);
    if (existingIndex > -1) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal
            .add(_availableMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: BottomTabScreen.routeName,
      routes: {
        BottomTabScreen.routeName: (ctx) => BottomTabScreen(_favouriteMeal),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        TabScreen.routeName: (ctx) => TabScreen(_favouriteMeal),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetails.routeName: (ctx) =>
            MealDetails(toggleFavourite, isMealFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(),
        // FavouriteScreen.routeName: (ctx) => FavouriteScreen(_favouriteMeal),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   // return MaterialPageRoute(
      //   //   builder: (context) => CategoriesScreen(),
      //   // );
      // },
      // onUnknownRoute: (settings) {
      //   print(settings.name);
      // },
    );
  }
}
