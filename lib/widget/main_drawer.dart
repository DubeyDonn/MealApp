import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).viewPadding.top,
          color: Theme.of(context).primaryColorDark,
        ),
        Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewPadding.top,
          color: Theme.of(context).primaryColorDark,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Meal Deal',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                leading: const Icon(
                  Icons.category,
                  size: 30,
                ),
                title: const Text('Category'),
                selected: true,
                selectedColor: Colors.amber,
                style: ListTileStyle.list,
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(FiltersScreen.routeName);
                },
                // hoverColor: Colors.amber,
                // focusColor: Colors.amber,

                leading: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: const Text('Add Filters'),
                style: ListTileStyle.list,
                textColor: Colors.white,
                iconColor: Colors.white,
              )
            ],
          ),
        )
      ]),
    );
  }
}
