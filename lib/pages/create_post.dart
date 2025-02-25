import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/ingredient_item.dart';
import 'package:tastebuds/model/objects/post_item.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _stepsController = TextEditingController();
  final _priceController = TextEditingController();

  // Ingredient controllers
  final _ingredientNameController = TextEditingController();
  final _ingredientValueController = TextEditingController();
  String? _selectedUnitType = 'none'; // Default unit type

  // Dropdown for difficulty level
  int _difficulty = 1;

  // List for ingredients (assuming you have an Ingredient model)
  List<IngredientItem> _ingredients = [];

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle post creation here
      final newPost = PostItem(
        id: DateTime.now().toString(), // Generate a unique ID for the post
        authorId: 'User123', // Example, replace with actual user ID
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        steps: _stepsController.text.split('\n'), // Split the steps into a list
        uploadTime: DateTime.now(),
        likes: 0,
        favorites: 0,
        difficulty: _difficulty,
        price: double.tryParse(_priceController.text) ?? 0.0,
        ingredients: _ingredients,
      );

      // Submit the new post to your backend or database
      print("Post Created: $newPost");
    }
  }

  // Function to add ingredient
  void _addIngredient() {
    final name = _ingredientNameController.text;
    final value = double.tryParse(_ingredientValueController.text);
    if (name.isNotEmpty && value != null && _selectedUnitType != null) {
      setState(() {
        _ingredients.add(IngredientItem(
          name: name,
          value: value,
          unit: _selectedUnitType!,
        ));
        _ingredientNameController.clear();
        _ingredientValueController.clear();
        _selectedUnitType = 'none'; // Reset unit type
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              // Description Field
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              // Image URL Field
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),

              // Steps Field
              TextFormField(
                controller: _stepsController,
                decoration: InputDecoration(labelText: 'Steps'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the steps';
                  }
                  return null;
                },
              ),

              // Difficulty Dropdown
              DropdownButtonFormField<int>(
                value: _difficulty,
                decoration: InputDecoration(labelText: 'Difficulty'),
                onChanged: (int? newValue) {
                  setState(() {
                    _difficulty = newValue ?? 1;
                  });
                },
                items: [1, 2, 3, 4, 5]
                    .map((difficulty) => DropdownMenuItem<int>(
                          value: difficulty,
                          child: Text('Difficulty $difficulty'),
                        ))
                    .toList(),
              ),

              // Price Field
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),

              // Ingredient Fields
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ingredientNameController,
                      decoration: InputDecoration(labelText: 'Ingredient Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an ingredient name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _ingredientValueController,
                      decoration:
                          InputDecoration(labelText: 'Ingredient Value'),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an ingredient value';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedUnitType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedUnitType = newValue;
                      });
                    },
                    items: [
                      'none',
                      'teaspoon',
                      'tablespoon',
                      'cup',
                      'pint',
                      'quart',
                      'gallon',
                      'fluidOunce',
                      'mililiter',
                      'liter',
                      'decalitre',
                      'gill',
                      'gram',
                      'kilogram',
                      'ounce',
                      'pound'
                    ]
                        .map((unit) => DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            ))
                        .toList(),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _addIngredient,
                child: Text('Add Ingredient'),
              ),
              if (_ingredients.isNotEmpty)
                Wrap(
                  spacing: 8.0,
                  children: _ingredients
                      .map((ingredient) => Chip(
                            label: Text(
                                '${ingredient.getValue()} ${ingredient.getUnitType()} ${ingredient.getName()}'),
                          ))
                      .toList(),
                ),

              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Create Post'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
