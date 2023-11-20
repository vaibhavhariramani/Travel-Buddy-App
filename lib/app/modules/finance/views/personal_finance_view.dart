import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/body.dart';
import '../../../data/models/expensedata.dart';
import '../../auth/authecation/controllers/auth_controller.dart';
import '../../widgets/expense.dart';
import '../controllers/finance_controller.dart';

class PersonalFinanceView extends GetView<FinanceController> {
  // PersonalFinanceView({Key? key}) : super(key: key);
  @override
  final FinanceController controller = Get.put(FinanceController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Expense>>(
      stream: expenseStream,
      builder: (context, snapshot) {
        final expenses = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(
            title: Text('Expense Tracker'),
            actions: [
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () => _showRemoveAllConfirmation(context, expenses),
                tooltip: 'Delete All Expenses',
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: signOut,
                tooltip: 'Sign Out',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddExpenseDialog(context),
            tooltip: 'Add Expense',
            child: Icon(Icons.add),
          ),
          body: snapshot.hasData
              ? BodyWidget(expenses: expenses)
              : LinearProgressIndicator(),
        );
      },
    );
  }

  Future<bool> _showAddExpenseDialog(BuildContext context) async {
    String name = '', description = '', amount = '0', date = '';
    return await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Expense'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (s) => name = s,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 3,
            onChanged: (s) => description = s,
          ),
          TextField(
            controller: controller.dateInput,
            //editing controller of this TextField
            decoration: InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter Date" //label text of field
                ),
            readOnly: true,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                date = formattedDate;
                // setState(() {
                controller.dateInput.text =
                    formattedDate; //set output date to TextField value.
                // });
              } else {}
            },
          ),
          TextFormField(
            initialValue: amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Amount'),
            onChanged: (s) => amount = s,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.-]')),
            ],
          ),
        ]),
        actions: [
          TextButton(
            child: Text('CANCEL'),
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop('dialog'),
            // Navigator.pop(context, false),
          ),
          TextButton(
            child: Text('CREATE'),
            onPressed: () async {
              // Navigator.pop(context, true);
              Navigator.of(context, rootNavigator: true).pop('dialog');
              final added = await createExpense(
                  name, description, double.tryParse(amount) ?? 0);
              if (!added) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to create the expense')));
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showRemoveAllConfirmation(
      BuildContext context, List<Expense> expenses) async {
    return await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Remove All Expenses?'),
        content: Text('Are you sure you want to remove all expenses?'),
        actions: <Widget>[
          TextButton(
            child: Text('NO'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('YES'),
            onPressed: () {
              Navigator.pop(context);
              expenses.forEach((expense) => expense.delete());
            },
          ),
        ],
      ),
    );
  }
}
