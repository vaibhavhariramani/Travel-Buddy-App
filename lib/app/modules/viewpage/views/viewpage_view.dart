import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/listCard.dart';
import '../controllers/viewpage_controller.dart';

class ViewpageView extends GetView<ViewpageController> {
  const ViewpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          title: 'Budget & Expenses',
          user: 'Manage Budget and Expenses',
          topic: 'Daily Expense',
          viewCount: 999000,
          thumbnail: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/sample1.jpeg',
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomListItem(
          title: 'What to Cook',
          user: 'Recommends Breakfast on the basis of food items availabale',
          topic: 'Breakfast, Lunch, Snacks and Dinner',
          viewCount: 884000,
          thumbnail: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/sample2.jpeg',
                ),
              ),
            ],
          ),
        ),
        CustomListItem(
          title: 'Todo',
          user: 'Manage Assignments',
          topic: 'Sync Calendar',
          viewCount: 999000,
          thumbnail: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/sample1.jpeg',
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomListItem(
          title: 'GROCERY LIST',
          user: 'LIST',
          topic: 'Needs',
          viewCount: 999000,
          thumbnail: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/sample1.jpeg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
