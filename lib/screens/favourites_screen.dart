import 'package:flutter/material.dart';
import 'package:meal_app/model/recipe.dart';

import '../widget/recipe_item.dart';

class FavouritesScreen extends StatefulWidget {
  List<Recipe> favouriteRecipe;

  FavouritesScreen(this.favouriteRecipe, {super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late List<Recipe> favRecipe;
  @override
  void initState() {
    favRecipe = widget.favouriteRecipe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.favouriteRecipe.isEmpty
          ? const Text('There is no favourites.')
          : ListView.builder(
              itemBuilder: (context, index) => RecipeItem(
                    id: favRecipe[index].id,
                    title: favRecipe[index].title,
                    affordability: favRecipe[index].affordability,
                    complexity: favRecipe[index].complexity,
                    duration: favRecipe[index].duration,
                    imageUrl: favRecipe[index].imageUrl,
                    // deleteItem: _deleteItem,
                    // ingredients: categoryRecipes[index].ingredients,
                    // isGlutenFree: categoryRecipes[index].isGlutenFree,
                    // isLactoseFree: categoryRecipes[index].isLactoseFree,
                    // isVegan: categoryRecipes[index].isVegan,
                    // isVegetarian: categoryRecipes[index].isVegetarian,
                    // steps: categoryRecipes[index].steps,
                  ),
              itemCount: favRecipe.length),
    );
  }
}
