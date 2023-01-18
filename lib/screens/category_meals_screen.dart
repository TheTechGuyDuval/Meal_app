import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(!_loadedInitData){
   final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
     displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId) ;
    }).toList();
    _loadedInitData = true;
    }
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: Container(
        child: ListView.builder(
          itemCount:displayedMeals!.length ,
          itemBuilder: (context,index){
            return MealItem(
              id:displayedMeals![index].id ,
              title: displayedMeals![index].title,
              duration:displayedMeals![index].duration ,
              affordability: displayedMeals![index].affordability,
              complexity: displayedMeals![index].complexity,
              imageUrl: displayedMeals![index].imageUrl,
            );
        
        }),
      ),
    );
  }
}