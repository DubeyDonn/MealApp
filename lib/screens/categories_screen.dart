import 'package:flutter/material.dart';
import '../widget/category_item.dart';

import '../data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('MealDeal'),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCategory
            .map(
              (cat) => CategoryBox(
                id: cat.id,
                color: cat.color,
                title: cat.title,
              ),
            )
            .toList(),
      ),
    );
  }
}
