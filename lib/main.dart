import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/recipe.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/recipe_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'screens/category_recipe_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Recipe> _availableRecipe = dummyRecipe;
  final List<Recipe> _favouriteRecipe = [];

  _addFilter(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _availableRecipe = dummyRecipe.where((element) {
        if (!element.isGlutenFree && _filters['glutenFree']!) {
          return false;
        }
        if (!element.isLactoseFree && _filters['lactoseFree']!) {
          return false;
        }
        if (!element.isVegan && _filters['vegan']!) {
          return false;
        }
        if (!element.isVegetarian && _filters['vegetarian']!) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  void _toggleFavourites(String recipeId) {
    var favouriteIndex =
        _favouriteRecipe.indexWhere((element) => element.id == recipeId);

    if (favouriteIndex >= 0) {
      setState(() {
        _favouriteRecipe.removeAt(favouriteIndex);
      });
    } else {
      setState(() {
        _favouriteRecipe
            .add(dummyRecipe.firstWhere((element) => element.id == recipeId));
      });
    }
  }

  bool _isFavourite(String recipeId) =>
      _favouriteRecipe.any((element) => element.id == recipeId);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal app',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(_favouriteRecipe),
        CategoryRecipeScreen.routeName: (context) =>
            CategoryRecipeScreen(_availableRecipe),
        RecipeDetailsScreen.routeName: (context) =>
            RecipeDetailsScreen(_toggleFavourites,_isFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_addFilter, _filters),
      },
    );
  }
}
