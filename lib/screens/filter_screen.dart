import 'package:flutter/material.dart';
//drawer
import '../widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filter Page'),
      ),
      body: Center(
        child: Text('Center page'),
      ),
    );
  }
}
