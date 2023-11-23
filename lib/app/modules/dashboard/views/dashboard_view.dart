import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../finance/views/finance_view.dart';
import '../../homescreen/views/homescreen_view.dart';
import '../../recipe/views/recipe_view.dart';
import '../../widgets/constant.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      cards(
                        colour: Color(0xFF1A95B6),
                        img: 'images/budget.png',
                        height: 0.4,
                        width: 0.4,
                        title: 'Budgets &',
                        subtitle: 'Finance',
                        wid: FinanceView(),
                      ),
                      cards(
                        colour: Color(0xFFE67E49),
                        img: 'images/roommates.png',
                        height: 0.4,
                        width: 0.4,
                        title: ' Roomates/',
                        subtitle: 'Flatmates',
                        wid: HomescreenView(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      cards(
                        colour: Color(0xFF6674F1),
                        img: 'images/recipe.png',
                        height: 0.4,
                        width: 0.4,
                        title: ' Recipe ',
                        subtitle: 'Recommendation',
                        wid: RecipeView(),
                      ),
                      cards(
                        colour: Color(0xFFE44E4F),
                        img: 'images/grocery.png',
                        height: 0.4,
                        width: 0.4,
                        title: 'Grocery',
                        subtitle: 'List',
                        wid: HomescreenView(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      cards(
                        colour: Color(0xFF1A95B6),
                        img: 'images/soon.png',
                        height: 0.4,
                        width: 0.4,
                        title: 'Coming',
                        subtitle: 'soon',
                        wid: HomescreenView(),
                      ),
                      cards(
                        colour: Color(0xFFE67E49),
                        img: 'images/soon.png',
                        height: 0.4,
                        width: 0.4,
                        title: 'Coming',
                        subtitle: 'soon',
                        wid: HomescreenView(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
