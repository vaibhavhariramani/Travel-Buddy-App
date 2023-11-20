import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splitwise_controller.dart';

class SplitwiseView extends GetView<SplitwiseController> {
  const SplitwiseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplitwiseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SplitwiseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
