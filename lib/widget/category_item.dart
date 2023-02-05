import 'package:flutter/material.dart';
import '../screens/category_recipe_list_screen.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox(
      {required this.color, required this.title, required this.id, super.key});

  final Color color;
  final String title;
  final String id;
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryRecipeScreen.routeName,
      //passing these arguments to next screen {CategoryMealsScreen}
      arguments: {
        'id': id,
        'title': title,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        //margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.5),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
