import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
  const TabsScreen( {super.key, required this.favoritesMeals});
 final List<Meal>favoritesMeals;
  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
   late List<Map<String ,Object>>_pages;
  int _selectedPageIndex=0;
  @override
  void initState() {
    _pages=[
      {
        'pages':  const CategoriesScreen(),
        'title' :'Categories'},
      {
        'pages':   FavoritesScreen(favoritesMeals:widget.favoritesMeals,),
        'title' :'Your Favorites'
      },

    ];
    super.initState();
  }
  void _selectPage(int index){
   setState(() {
     _selectedPageIndex=index;
   });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title:  Text(_pages[_selectedPageIndex]['title'].toString(),


      ),

      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['pages'] as Widget,
       bottomNavigationBar: BottomNavigationBar(

         onTap:_selectPage,
         backgroundColor: Theme.of(context).primaryColor,
         unselectedItemColor: Colors.white,
         selectedItemColor:Colors.amber ,
         currentIndex: _selectedPageIndex,
       //  type:BottomNavigationBarType.fixed ,
         items: [
           BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.category,),
             label: 'Categories',
           ),
           BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.star,),
             label: 'Favorites',
           ),

         ],
       ),
    );
  }
}
