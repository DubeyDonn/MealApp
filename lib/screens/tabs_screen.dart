import 'package:flutter/material.dart';
import 'package:meal_app/model/recipe.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Recipe> favouriteRecipe;
  const TabsScreen(this.favouriteRecipe, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> pages;

  @override
  void initState() {
    pages = [
      {
        'page': const CategoryScreen(),
        'title': 'Categories',
        'color': Colors.pink,
      },
      {
        'page': FavouritesScreen(widget.favouriteRecipe),
        'title': 'Favourites',
        'color': Colors.green,
      }
    ];
    super.initState();
  }

  int _selectedIndex = 0;
  void _selectBarItem(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedIndex]['title'] as String),
        backgroundColor: pages[_selectedIndex]['color'] as Color,
      ),
      drawer: const MainDrawer(),
      body: pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        elevation: 10,
        type: BottomNavigationBarType.shifting,
        // fixedColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,

        onTap: _selectBarItem,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Category',
          ),
          const BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
