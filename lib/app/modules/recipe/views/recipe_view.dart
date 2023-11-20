import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';

class RecipeView extends GetView<RecipeController> {
  const RecipeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
