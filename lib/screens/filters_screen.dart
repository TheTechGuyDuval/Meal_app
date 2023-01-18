import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentfilters;
   FiltersScreen(this.currentfilters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {

    _glutenfree = widget.currentfilters['gluten']!;
    _vegetarian = widget.currentfilters['vegetarian']!;
    _vegan = widget.currentfilters['vegan']!;
    _lactoseFree = widget.currentfilters['lactose']!;
    // TODO: implement initState
    super.initState();
  }


  Widget _buildSwitchListtile(String title ,String description,bool currentvalue,Function updateValue){
    return  SwitchListTile(
                  value: currentvalue,
                  onChanged:(value) =>  updateValue(value),
                  title: Text(title),
                  subtitle: Text(description),
                );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              final selectedFilters = {
           'gluten': _glutenfree,
           'lactose': _lactoseFree,
            'vegan': _vegan,
           'vegetarian': _vegetarian,

              };
              widget.saveFilters(selectedFilters);
            },
             icon: Icon(Icons.save))
          ],
          title: Text('Your Filters'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListtile('Gluten-free', 'Only include gluten-free meals',_glutenfree, (newValue){
                  setState(() {
                    _glutenfree = newValue;
                  });
                }),
                 _buildSwitchListtile('lactose-free', 'Only include Lactose-free meals',_lactoseFree, (newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                  _buildSwitchListtile('Vegetarian', 'Only include Vegetarian meals',_vegetarian, (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                  _buildSwitchListtile('Vegan', 'Only include Vegan meals',_vegan, (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
