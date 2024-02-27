import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
   FavoritesScreen( {super.key, required this.favoritesMeals});
  List<Meal> favoritesMeals;
  @override
  Widget build(BuildContext context) {
     if(favoritesMeals.isEmpty){
       return const Center(child: Text('You have no Favorites -start adding some Meals!'),);
     }
     else{
       return ListView.builder(itemBuilder: (ctx,index) {
         return MealItem(
           title: favoritesMeals![index].title,
           imageUrl: favoritesMeals![index].imageUrl,
           duration: favoritesMeals![index].duration,
           complexity: favoritesMeals![index].complexity,
           affordability: favoritesMeals![index].affordability,
           id: favoritesMeals![index].id,

         );
       },itemCount: favoritesMeals.length , );

     }

  }
}
