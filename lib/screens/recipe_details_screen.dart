import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widget/stacked_image.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const String routeName = '/recipe-screen';
  final Function toggleFavourites;
  final Function isFavourite;
  const RecipeDetailsScreen(this.toggleFavourites, this.isFavourite,
      {super.key});

  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //extracting argument passed from widget of previous screen ie. recipe_item
    final id = ModalRoute.of(context)!.settings.arguments as String;

    final recipeDetails = dummyRecipe.firstWhere(
      (element) => element.id.contains(id),
    );

    Widget buildIngredOrSteps({required Widget child, required String title}) {
      return Column(
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            height: 200,
            width: 300,
            child: child,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the recipe details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackedImage(
              imageUrl: recipeDetails.imageUrl,
              title: recipeDetails.title,
              radius: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            buildIngredOrSteps(
              title: 'Ingredients',
              child: ListView.builder(
                // padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          // Text(
                          //   '${index + 1}.',
                          //   style: const TextStyle(color: Colors.red),
                          // ),
                          // const SizedBox(
                          //   width: 3,
                          // ),
                          Expanded(
                            child: Center(
                              child: Text(
                                recipeDetails.ingredients[index],
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: recipeDetails.ingredients.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildIngredOrSteps(
              title: 'Steps:',
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(
                          recipeDetails.steps[index],
                        ),
                      ),
                      const Divider(color: Colors.grey),
                    ],
                  );
                },
                itemCount: recipeDetails.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop(id);
          toggleFavourites(id);
        },
        child: isFavourite(id)
            ? const Icon(Icons.star, color: Colors.black)
            : const Icon(
                Icons.star_outline,
                color: Colors.black,
              ),
      ),
    );
  }
}
