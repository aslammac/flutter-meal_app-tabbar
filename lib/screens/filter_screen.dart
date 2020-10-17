import 'package:flutter/material.dart';
//drawer
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function setFilter;
  final Map<String, bool> filters;
  FilterScreen(this.setFilter, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _luctosFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _luctosFree = widget.filters['luctose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filter Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'luctose': _luctosFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.setFilter(selectedFilters);
            },
            padding: EdgeInsets.all(15),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                _buildSwitchTile(
                    'Gluten Free', 'Only gluten free meal', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile('Vegetarian', 'Only veg meal', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTile(
                    'Lautos Free', 'Only luctos free meal', _luctosFree,
                    (newValue) {
                  setState(() {
                    _luctosFree = newValue;
                  });
                }),
                _buildSwitchTile('Vegan', 'Only vegan meal', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
