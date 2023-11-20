import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/webview_controller.dart';

class WebviewView extends GetView<WebviewController> {
  const WebviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebviewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WebviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
