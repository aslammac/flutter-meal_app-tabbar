import 'package:flutter/material.dart';

//screens
import '../screens/bottom_tabbar_screen.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(String linkTitle, Function handler, Icon iconValue) {
      return ListTile(
        leading: iconValue,
        title: Text(linkTitle),
        onTap: handler,
      );
    }

    void handlerPush(BuildContext context, routeName) {
      Navigator.of(context).pushReplacementNamed(routeName);
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.white54,
            alignment: Alignment.center,
            child: Text(
              'Cooking',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          ),
          _buildListTile(
              'Category',
              () => handlerPush(context, BottomTabScreen.routeName),
              Icon(Icons.category)),
          _buildListTile(
              'Filter',
              () => handlerPush(context, FilterScreen.routeName),
              Icon(Icons.filter)),
        ],
      ),
    );
  }
}
