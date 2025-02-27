import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'dart:io';

import 'package:tastebuds/model/objects/ingredient_item.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/service/database_service.dart';

class CreatePostFormData {
  String title;
  String description;
  File file;
  List<IngredientItem> ingredients;
  List<String> steps;
  int difficulty;
  double priceEstimation;
  CreatePostFormData(
      {required this.title,
      required this.description,
      required this.file,
      required this.ingredients,
      required this.steps,
      required this.difficulty,
      required this.priceEstimation});
}

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  List<IngredientItem> ingredients = <IngredientItem>[];
  int difficultyRating = 0;
  double priceEstimation = 0;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<TextEditingController> stepControllers = [];
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientNameController =
      TextEditingController();
  final TextEditingController ingredientValueController =
      TextEditingController(text: "0");
  UnitType selectedUnit = UnitType.none;

  Future<void> _pickImage(FormFieldState<File> state) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state.didChange(File(pickedFile.path));
      _image = File(pickedFile.path);
    }
  }

  String? validateLists() {
    if (ingredients.isEmpty) {
      return "Must have at least one ingredient";
    } else if (stepControllers.isEmpty) {
      return "Must have at least one step";
    } else if (stepControllers.map((c) => c.text).contains("")) {
      return "Cannot have any empty steps";
    } else {
      return null;
    }
  }

  void _addIngredient() {
    final String name = ingredientNameController.text.trim();
    final double? value = double.tryParse(ingredientValueController.text);
    if (name.isNotEmpty && value != null) {
      setState(() {
        ingredients.add(IngredientItem.withUnitType(
            name: name, value: value, unit: selectedUnit));
        ingredientNameController.clear();
        ingredientValueController.text = "0";
        selectedUnit = UnitType.none;
      });
    }
  }

  void _removeIngredient(int index) {
    setState(() {
      ingredients.removeAt(index);
    });
  }

  void _addStep() {
    setState(() {
      stepControllers.add(TextEditingController());
    });
  }

  void _removeStep(int index) {
    setState(() {
      stepControllers.removeAt(index);
    });
  }

  static String? validateTitle(String? title) {
    // Must have a title
    if (title == null || title.isEmpty) {
      return 'Title cannot be empty';
    }
    // Title cant be too short
    if (title.length < 4) {
      return 'Title should be at least 10 characters long';
    }
    // Title cant be too long
    if (title.length > 50) {
      return 'Title should not exceed 80 characters';
    }
    return null; // Valid title
  }

  static String? validateDescription(String? description) {
    // Its fine if description is empty
    if (description == null) return null;
    // Now that description is not null, check if too long
    if (description.length > 300) {
      return 'Description should not exceed 300 characters';
    }
    return null; // Valid description
  }

  static String? validateImage(File? imagePath) {
    if (imagePath == null) {
      return "Requires image";
    }
    return null;
  }

  Future<bool> sendPost() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      print("not valid");
      return false;
    }
    if (_image == null) {
      final snackBar = SnackBar(content: Text("Image required"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    final String? checkLists = validateLists();
    if (checkLists != null) {
      final snackBar = SnackBar(content: Text(checkLists));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    CreatePostFormData data = CreatePostFormData(
      title: titleController.text,
      description: descriptionController.text,
      file: _image!,
      steps: stepControllers.map((c) => c.text).toList(),
      ingredients: ingredients,
      priceEstimation: priceEstimation,
      difficulty: difficultyRating,
    );
    PostItem createdPost = await PostItem.fromCreateForm(data);
    Post? response = await Database.createPost(createdPost);
    if (response == null) {
      return false;
    }
    print(response);
    return true;
  }

  Widget _buildPriceEstimator() {
    Text priceInfoWidget;

    double snapValue(double value, int mult) {
      return (value / mult).roundToDouble() * mult;
    }

    if (priceEstimation >= 100.0) {
      priceInfoWidget = Text("Price estimation: \$$priceEstimation+");
    } else if (priceEstimation == 0.0) {
      priceInfoWidget = Text("Price estimation: free");
    } else {
      priceInfoWidget =
          Text("Price estimation: \$${priceEstimation.toStringAsFixed(1)}");
    }
    return Column(
      children: [
        priceInfoWidget,
        Slider(
          value: priceEstimation,
          min: 0,
          max: 100,
          divisions: 20,
          label: priceEstimation.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              priceEstimation = value; // Update temp value for smooth sliding
            });
          },
          onChangeEnd: (double value) {
            setState(() {
              // Snap the value to the nearest multiple of 5
              priceEstimation = snapValue(value.toDouble(), 5);
            });
          },
        ),
      ],
    );
  }

  Widget _buildStarRating(int rating, Function(int) onRatingSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            size: 40,
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () => onRatingSelected(index + 1),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBC02D),
        title: Text(
          "Create post",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          // Make the entire body scrollable
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Form(
              key: formKey,
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Title', hintText: "What's your dish called?"),
                  controller: titleController,
                  validator: validateTitle,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Describe your dish", labelText: 'Description'),
                  controller: descriptionController,
                  maxLines: 5,
                  minLines: 3,
                  validator: validateDescription,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 10),
                FormField<File>(
                    initialValue: null,
                    validator: validateImage,
                    builder: (FormFieldState<File> state) {
                      return GestureDetector(
                        onTap: () async {
                          _pickImage(state);
                        },
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: state.value == null
                              ? const Center(child: Text('Select an image'))
                              : Image.file(state.value!, fit: BoxFit.cover),
                        ),
                      );
                    }),
                const SizedBox(height: 10),
                const Text('Ingredients',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ])),
          ingredients.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    IngredientItem item = ingredients[index];
                    return Column(children: [
                      ListTile(
                        title: Text(item.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.red),
                          onPressed: () => _removeIngredient(index),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1.0,
                        color: const Color.fromARGB(255, 104, 104, 104),
                      ),
                    ]);
                  },
                )
              : Center(child: Text('No items')),
          const SizedBox(height: 5),
          const Center(
              child: Text(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  "Add Ingredient")),
          Row(children: [
            Expanded(
              child: TextFormField(
                controller: ingredientNameController,
                decoration: InputDecoration(labelText: "Ingredient Name"),
              ),
            )
          ]),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: ingredientValueController,
                  decoration: InputDecoration(labelText: "Amount"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: DropdownButtonFormField<UnitType>(
                  value: selectedUnit,
                  onChanged: (UnitType? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedUnit = newValue;
                      });
                    }
                  },
                  items: UnitType.values.map((UnitType unit) {
                    return DropdownMenuItem<UnitType>(
                      value: unit,
                      child: Text(unit.toString().split('.').last),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: "Unit"),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: _addIngredient,
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Center(
              child: Text('Steps',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stepControllers.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: stepControllers[index],
                      decoration:
                          InputDecoration(labelText: 'Step ${index + 1}'),
                      minLines: 1,
                      maxLines: 4,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () => _removeStep(index),
                  ),
                ],
              );
            },
          ),
          Center(
            child: OutlinedButton.icon(
              label: Text("Add step"),
              icon: const Icon(Icons.add_circle, color: Colors.green),
              onPressed: _addStep,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              const Text('Difficulty:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              _buildStarRating(difficultyRating,
                  (rating) => setState(() => difficultyRating = rating)),
              const SizedBox(height: 10),
              const Text('Estimated price:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              _buildPriceEstimator(),
              const SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: OutlinedButton(
              onPressed: () {
                sendPost().then((value) {
                  if (context.mounted && value) {
                    Navigator.pop(context);
                  }
                });
              },
              child: const Text('Post'),
            ),
          ),
        ]),
      )),
    );
  }
}
