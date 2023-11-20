import 'package:flutter/material.dart';
import 'package:flutter_dashboard/flutter_dashboard.dart';
import '../../../../../../themes/app_theme.dart';
import '../../../../widgets/animated_submit_button.dart';
import '../../../../widgets/form_input_field.dart';
import '../../../../widgets/labled_textfield.dart';
import '../../controllers/registration_controller.dart';

class Step1 extends GetResponsiveView<RegistrationController> {
  RegistrationController controller2 = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ReactiveFormBuilder(
        form: () => controller2.editForm,
        builder: (BuildContext context, FormGroup _form, Widget? child) {
          return Obx(
            () => Padding(
              padding: EdgeInsets.all(size.height > 770
                  ? 64
                  : size.height > 670
                      ? 32
                      : 16),
              child: Container(
                // elevation: 4,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(25),
                //   ),
                // ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: size.height *
                      (size.height > 770
                          ? 0.7
                          : size.height > 670
                              ? 0.8
                              : 0.9),
                  // width: 500,
                  width: Get.width * 0.4,
                  // color: Theme.of(context).canvasColor,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Visibility(
                              visible: !controller2.isStep1Completed.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Partner with us",
                                    style: TextStyle(
                                      fontSize: 60,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Divider(
                                      color: AppColors.green,
                                      thickness: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 55,
                                        child: LabeledTextField(
                                          label: 'Shop Name *',
                                          textfield: FormTextInputField(
                                            readOnly:
                                                controller2.isEditing.isFalse,
                                            controlName: 'shop_name',
                                            hintText: 'Lucy',
                                            onEditingComplete: () =>
                                                _form.focus('shop_city'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            validationMessage: (control) =>
                                                'Shop Name can not be empty',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 45,
                                        child: LabeledTextField(
                                            label: 'Shop City *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'shop_city',
                                              hintText: 'Kochi',
                                              onEditingComplete: () =>
                                                  _form.focus('partner_type'),
                                              keyboardType: TextInputType.phone,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Shop City can not be empty',
                                            )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 55,
                                        child: LabeledTextField(
                                            label: 'Owner/Manager  *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'partner_type',
                                              hintText: 'Owner',
                                              onEditingComplete: () =>
                                                  _form.focus('owner_name'),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'form can not be empty',
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          flex: 45,
                                          child: LabeledTextField(
                                            label: 'Owner Name *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'owner_name',
                                              hintText: '80398272738',
                                              onEditingComplete: () =>
                                                  _form.focus('owner_email'),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Owner Name can not be empty',
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 55,
                                        child: LabeledTextField(
                                            label: 'Owner email *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'owner_email',
                                              hintText: 'jesse@cucumia.com',
                                              onEditingComplete: () =>
                                                  _form.focus('mobile_no'),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Owner email can not be empty',
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          flex: 45,
                                          child: LabeledTextField(
                                            label: 'Mobile Number *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'mobile_no',
                                              hintText: '80398272738',
                                              onEditingComplete: () =>
                                                  _form.focus('address'),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Mobile Number can not be empty',
                                            ),
                                          )),
                                    ],
                                  ),

                                  Divider(
                                    height: Get.height * 0.05,
                                  ),

                                  // const SizedBox(
                                  //   height: 32,
                                  // ),
                                  // const TextField(
                                  //   decoration: InputDecoration(
                                  //     hintText: 'Email',
                                  //     labelText: 'Email',
                                  //     suffixIcon: Icon(
                                  //       Icons.mail_outline,
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 32,
                                  // ),
                                  // const TextField(
                                  //   decoration: InputDecoration(
                                  //     hintText: 'Password',
                                  //     labelText: 'Password',
                                  //     suffixIcon: Icon(
                                  //       Icons.lock_outline,
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 64,
                                  // ),
                                  // actionButton("Log In"),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // const Text(
                                      //   "You do not have an account?",
                                      //   style: TextStyle(
                                      //     color: Colors.grey,
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                controller2.isStep1Completed
                                                    .value = true;
                                              },
                                              child: Container(
                                                width: 100,
                                                color: AppColors.greencard,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text("Next"),
                                                      Icon(Icons
                                                          .arrow_forward_ios),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: controller2.isStep1Completed.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Partner With Us",
                                    style: TextStyle(
                                      fontSize: 60,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Divider(
                                      color: AppColors.green,
                                      thickness: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 55,
                                        child: LabeledTextField(
                                          label: 'Shop Full Address *',
                                          textfield: FormTextInputField(
                                            readOnly:
                                                controller2.isEditing.isFalse,
                                            controlName: 'shop_full_adress',
                                            hintText: 'Shop address',
                                            onEditingComplete: () =>
                                                _form.focus('shop_contact'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            validationMessage: (control) =>
                                                'Shop Full Address can not be empty',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 45,
                                        child: LabeledTextField(
                                            label: 'Shop Contact Number*',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'shop_contact',
                                              hintText: 'Kochi',
                                              onEditingComplete: () =>
                                                  _form.focus('partner_type'),
                                              keyboardType: TextInputType.phone,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Shop Contact Number can not be empty',
                                            )),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Select your Location on the Map",
                                        textAlign: TextAlign.left,
                                      ),
                                      Center(
                                        child: Image.asset(
                                          "assets/map.png",
                                          width: Get.width * 0.28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 60,
                                        child: Row(
                                          children: [
                                            Icon(Icons.search),
                                            // TextField(
                                            //   decoration: InputDecoration(
                                            //       labelText: 'Enter Name'),
                                            // ),
                                            // Divider(),
                                            Expanded(
                                                child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Search",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .greentext),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            side:
                                                                const BorderSide(
                                                              width: 1.0,
                                                              color: AppColors
                                                                  .greencard,
                                                            ),
                                                            primary:
                                                                Colors.white))),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 10,
                                          child: Center(child: Text("OR"))),
                                      Expanded(
                                        flex: 25,
                                        child: AnimatedSubmitButton(
                                          onPressed: () async {},
                                          buttonText: "Current Location",
                                          radius: 6,
                                          textColor: Colors.white,
                                          color: AppColors.greencard,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Shop Timings",
                                        textScaleFactor: Get.textScaleFactor,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 55,
                                        child: LabeledTextField(
                                            label: 'Shop Opening *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'shop_opening',
                                              hintText: '10 : 00 AM',
                                              onEditingComplete: () =>
                                                  _form.focus('shop_closing'),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Shop Opening can not be empty',
                                            )),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          flex: 45,
                                          child: LabeledTextField(
                                            label: 'Shop Closing *',
                                            textfield: FormTextInputField(
                                              readOnly:
                                                  controller2.isEditing.isFalse,
                                              controlName: 'shop_closing',
                                              hintText: '10 : 00 PM',
                                              onEditingComplete: () =>
                                                  _form.focus('address'),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validationMessage: (control) =>
                                                  'Mobile Number can not be empty',
                                            ),
                                          )),
                                    ],
                                  ),
                                  Divider(
                                    height: Get.height * 0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Language Prefer",
                                        textScaleFactor: Get.textScaleFactor,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton<String>(
                                          hint: const Text('English-US'),
                                          items: <String>[
                                            'English-US',
                                            'English-US',
                                            'English-US',
                                            'English-US'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (_) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Category",
                                        textScaleFactor: Get.textScaleFactor,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 45,
                                        child: Row(
                                          children: [
                                            Obx(
                                              () => Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor: AppColors.green,
                                                value: controller2
                                                    .isRestaurant.value,
                                                onChanged: (bool? value) {
                                                  controller2
                                                      .isRestaurant.value;
                                                },
                                              ),
                                            ),
                                            const Text("Restaurant"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 45,
                                        child: Row(
                                          children: [
                                            Obx(
                                              () => Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor: AppColors.green,
                                                value: controller2
                                                    .isRestaurant.value,
                                                onChanged: (bool? value) {
                                                  controller2
                                                      .isRestaurant.value;
                                                },
                                              ),
                                            ),
                                            const Text("Bakery"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 45,
                                        child: Row(
                                          children: [
                                            Obx(
                                              () => Checkbox(
                                                checkColor: Colors.greenAccent,
                                                activeColor: AppColors.green,
                                                value: controller2
                                                    .isRestaurant.value,
                                                onChanged: (bool? value) {
                                                  controller2
                                                      .isRestaurant.value;
                                                },
                                              ),
                                            ),
                                            const Text("Supermarket"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                controller2.isStep1Completed
                                                    .value = true;
                                              },
                                              child: Container(
                                                width: 100,
                                                color: AppColors.greencard,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text("Next"),
                                                      Icon(Icons
                                                          .arrow_forward_ios),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
