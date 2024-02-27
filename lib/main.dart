import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';
import 'package:meals_app/screen/tabs_screen.dart';

import 'models/meal.dart';
import 'screen/categories_screen.dart';

void main() {

  runApp(const MyApp(categoryId: '', categoryTitle: '',));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key,  required this.categoryId, required this.categoryTitle});
  final String categoryId;
  final String categoryTitle;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan' :false,
    'vegetarian':false

  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List< Meal> _favoritesMeals=[];
  void _setFilters(Map<String,bool>filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! &&! meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });

  }

  void _toggleFavorites(String mealId){
     final existingIndex= _favoritesMeals.indexWhere((meal) => meal.id==mealId);
     if(existingIndex>=0){
       setState(() {
         _favoritesMeals.removeAt(existingIndex);
       });
     }
     else{
       setState(() {
         _favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
       });
     }
  }
  bool _isMealFavorites(String id){
    return _favoritesMeals.any((meal) => meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: false,
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(254, 255, 229, 1)   ,
        fontFamily: 'Raleway',

      ),
     // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(ctx) =>  TabsScreen(favoritesMeals:_favoritesMeals),
        CategoryMealsScreen.routeName:(ctx)=> CategoryMealsScreen(availableMeals:_availableMeals),
        MealDetailScreen.routeName:(ctx)=> MealDetailScreen(toggleFavorites:_toggleFavorites,isMealFavorites:_isMealFavorites),
       FiltersScreen.routeName:(ctx)=>FiltersScreen(_filters,_setFilters),

      },
       onGenerateRoute: (settings){
       // print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) =>CategoriesScreen() );
       },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>const CategoriesScreen(),);
      },

    );
  }
}


