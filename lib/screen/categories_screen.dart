import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: const Text('DeliMeal',style: TextStyle(
    //     fontWeight: FontWeight.bold
    //   ),)),
    //  body:
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
        children:DUMMY_CATEGORIES.map((catData)=>CategoryItem(id: catData.id,
            title: catData.title, color: catData.color)).toList(),
   //   ),
    );
  }
}
