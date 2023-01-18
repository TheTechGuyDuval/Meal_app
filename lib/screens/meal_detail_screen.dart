import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function togglFavorite;
  final Function _isFavorite;

  MealDetailScreen(this.togglFavorite,this._isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge));
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                        ),
                        Divider()
                      ],
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavorite(mealId) ?
          Icons.star
          :Icons.star_border,
        ),
        onPressed: () => togglFavorite(mealId),
      ),
    );
  }
}
