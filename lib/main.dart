import 'package:flutter/material.dart';

//screens
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tab_screen.dart';
import './screens/bottom_tabbar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static const routeName = '/';
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
      initialRoute: TabScreen.routeName,
      routes: {
        BottomTabScreen.routeName: (ctx) => BottomTabScreen(),
        TabScreen.routeName: (ctx) => TabScreen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetails.routeName: (ctx) => MealDetails(),
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
