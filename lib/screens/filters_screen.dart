import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filter-screen';

  Function addFilter;
  Map<String, bool> filters;
  FiltersScreen(this.addFilter, this.filters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _isVegan = false;
  bool _isvegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.filters['glutenFree'] as bool;
    _lactoseFree = widget.filters['lactoseFree'] as bool;
    _isVegan = widget.filters['vegan'] as bool;
    _isvegetarian = widget.filters['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Add Filter'),
        backgroundColor: Theme.of(context).primaryColor,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         var selectedFilters = {
        //           'glutenFree': _glutenFree,
        //           'lactoseFree': _lactoseFree,
        //           'vegan': _isVegan,
        //           'vegetarian': _isvegetarian,
        //         };
        //         print(selectedFilters);

        //         widget.addFilter(selectedFilters);
        //       },
        //       icon: const Icon(Icons.save))
        // ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten-free'),
                  subtitle: const Text('Only include gluten-free meals'),
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                      var selectedFilters = {
                        'glutenFree': _glutenFree,
                        'lactoseFree': _lactoseFree,
                        'vegan': _isVegan,
                        'vegetarian': _isvegetarian,
                      };
                      print(selectedFilters);

                      widget.addFilter(selectedFilters);
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose-free'),
                  subtitle: const Text('Only include lactose-free meals'),
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                      var selectedFilters = {
                        'glutenFree': _glutenFree,
                        'lactoseFree': _lactoseFree,
                        'vegan': _isVegan,
                        'vegetarian': _isvegetarian,
                      };
                      print(selectedFilters);
                      widget.addFilter(selectedFilters);
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include vegan meals'),
                  value: _isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                      var selectedFilters = {
                        'glutenFree': _glutenFree,
                        'lactoseFree': _lactoseFree,
                        'vegan': _isVegan,
                        'vegetarian': _isvegetarian,
                      };
                      print(selectedFilters);
                      widget.addFilter(selectedFilters);
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include vegetarian meals'),
                  value: _isvegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _isvegetarian = newValue;
                      var selectedFilters = {
                        'glutenFree': _glutenFree,
                        'lactoseFree': _lactoseFree,
                        'vegan': _isVegan,
                        'vegetarian': _isvegetarian,
                      };
                      print(selectedFilters);
                      widget.addFilter(selectedFilters);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
