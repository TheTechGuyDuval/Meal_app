import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
   TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, dynamic>>? _pages; 
  int _selectedPageIndex = 0;

@override
  void initState() {

    // TODO: implement initState
    super.initState();
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page':FavoriteScreen(widget.favoriteMeals),'title': 'Your Favorite'}
  ];
  }

  



  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MainDrawer(),
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: const [
            BottomNavigationBarItem(
              label: 'Categories',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(Icons.star),
            )
          ]),
    );
  }
}
