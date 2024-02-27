import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  //  const CategoryMealsScreen({super.key,  required this.categoryId, required this.categoryTitle});
  // final String categoryId;
  // final String categoryTitle;
  static const routeName = '/category-meals';


  final List<Meal> availableMeals;

  const CategoryMealsScreen({super.key, required this.availableMeals});
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
    String? categoryTitle;
    List<Meal>? displayedMeals;
    var _loadedInitData=false;

  @override
  void setState(VoidCallback fn) {

    super.setState(fn);
  }
  @override
  void didChangeDependencies() {
     if(!_loadedInitData){
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData=true;}
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              id: displayedMeals![index].id,
              //removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals?.length,
        ));
  }
}
