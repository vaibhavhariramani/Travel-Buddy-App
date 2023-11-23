import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/authecation/controllers/auth_controller.dart';
import '../../auth/authecation/views/auth_view.dart';
import '../../homescreen/views/homescreen_view.dart';
import '../../widgets/constant.dart';
import '../controllers/finance_controller.dart';
import 'personal_finance_view.dart';

class FinanceView extends GetView<FinanceController> {
  const FinanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: authSteam,
      builder: (context, snapshot) {
        final signedIn = snapshot.data ?? false;
        return Scaffold(
          appBar: AppBar(
              title: const Text('FinanceView'),
              centerTitle: true,
              actions: [
                signedIn
                    ? IconButton(
                        onPressed: (() => {}), icon: Icon(Icons.person_outline))
                    : TextButton(
                        onPressed: ((() => Get.to(AuthView()))),
                        child: const Text(
                          'login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )),
              ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          cards(
                            colour: Color(0xFF1A95B6),
                            img: 'images/budget.png',
                            height: 0.5,
                            width: 0.5,
                            title: 'Personal',
                            subtitle: 'Finance',
                            wid: PersonalFinanceView(),
                          ),
                          cards(
                            colour: Color(0xFFE67E49),
                            img: 'images/roommates.png',
                            height: 0.5,
                            width: 0.5,
                            title: ' Group',
                            subtitle: 'Finance',
                            wid: HomescreenView(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
