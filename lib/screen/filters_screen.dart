

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';
   final void Function(Map<String,bool>) saveFilters;
  final Map<String,bool> currentFilters;


 const FiltersScreen(this.currentFilters,this.saveFilters, {super.key});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree =  false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  void initState() {
    _glutenFree=widget.currentFilters['gluten']!;
    _lactoseFree=widget.currentFilters['lactose']!;
    _vegetarian=widget.currentFilters['vegetarian']!;
    _vegan=widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue,Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters'),
      actions: [
        IconButton(onPressed:(){
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.saveFilters(selectedFilters);}, icon: const Icon(Icons.save)),
      ],
      ),

      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              // SwitchListTile(title:Text('Gluten-free'),value: _glutenFree,subtitle:Text('Only include gluten-free meals') ,
              //     onChanged: (newValue){
              //   setState(() {
              //     _glutenFree=newValue;
              //   });
              //     })
              _buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include gluten-free meals',
                _lactoseFree,
                    (newValue) {
                  setState(
                        () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                    (newValue) {
                  setState(
                        () {
                      _vegetarian = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                    (newValue) {
                  setState(
                        () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
