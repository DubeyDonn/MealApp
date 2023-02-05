import 'package:flutter/material.dart';
import 'package:meal_app/model/recipe.dart';
import 'package:meal_app/screens/recipe_details_screen.dart';
import 'package:meal_app/widget/stacked_image.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem(
      {required this.affordability,
      required this.id,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      // required this.ingredients,
      // required this.isGlutenFree,
      // required this.isLactoseFree,
      // required this.isVegan,
      // required this.isVegetarian,
      // required this.steps,
      required this.title,
      // required this.deleteItem,
      super.key});

  // final List<Recipe> recipe;
  final String id;
  // final List<String> ingredients;
  final String title;
  final String imageUrl;
  // final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function deleteItem;
  // final bool isGlutenFree;
  // final bool isLactoseFree;
  // final bool isVegan;
  // final bool isVegetarian;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(
          RecipeDetailsScreen.routeName,
          arguments: id,
        ),
        //     .then(
        //   (value) {
        //     if (value != null) {
        //       // deleteItem(value);
        //     }
        //   },
        // ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Column(
            children: [
              StackedImage(imageUrl: imageUrl, title: title, radius: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer),
                        const SizedBox(
                          width: 2,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.balance),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
