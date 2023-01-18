

import 'package:flutter/Material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals;

FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(child: Text('You have no favorites yet start adding some!'));
    }
    else{
      return ListView.builder(
          itemCount:favoriteMeals.length ,
          itemBuilder: (context,index){
            return MealItem(
              id:favoriteMeals[index].id ,
              title: favoriteMeals[index].title,
              duration:favoriteMeals[index].duration ,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              imageUrl: favoriteMeals[index].imageUrl,
            );
        
        });
    }
  }
}