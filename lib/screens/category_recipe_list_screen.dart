import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../model/recipe.dart';
import '../widget/recipe_item.dart';

class CategoryRecipeScreen extends StatefulWidget {
  static const String routeName = '/category-meal-screen';

  List<Recipe> availableRecipe;

   CategoryRecipeScreen(this.availableRecipe, {super.key});

  @override
  State<CategoryRecipeScreen> createState() => _CategoryRecipeScreenState();
}

class _CategoryRecipeScreenState extends State<CategoryRecipeScreen> {
  String? title;
  Color? color;
  List<Recipe>? categoryRecipes;

  var isItemDeleted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isItemDeleted) {
      //extracting arguments passed to this screen from {category_item} class of previous screen
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      title = routeArgs['title'] as String;
      color = routeArgs['color'] as Color;
      final String id = routeArgs['id']! as String;

      categoryRecipes = widget.availableRecipe
          .where(
            (element) => element.catId.contains(id),
          )
          .toList();
      isItemDeleted = true;
    }

    super.didChangeDependencies();
  }

  // void _deleteItem(String id) {
  //   setState(() {
  //     categoryRecipes!.removeWhere((element) => element.id == id);
  //   });
  // }

  // final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: color,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => RecipeItem(
                id: categoryRecipes![index].id,
                title: categoryRecipes![index].title,
                affordability: categoryRecipes![index].affordability,
                complexity: categoryRecipes![index].complexity,
                duration: categoryRecipes![index].duration,
                imageUrl: categoryRecipes![index].imageUrl,
                // deleteItem: _deleteItem,
                // ingredients: categoryRecipes[index].ingredients,
                // isGlutenFree: categoryRecipes[index].isGlutenFree,
                // isLactoseFree: categoryRecipes[index].isLactoseFree,
                // isVegan: categoryRecipes[index].isVegan,
                // isVegetarian: categoryRecipes[index].isVegetarian,
                // steps: categoryRecipes[index].steps,
              ),
          itemCount: categoryRecipes!.length),
    );
  }
}
