import 'package:cloud_firestore/cloud_firestore.dart';

import '../../modules/auth/authecation/controllers/auth_controller.dart';
import '../../modules/widgets/expense.dart';

final _firestore = FirebaseFirestore.instance;

CollectionReference get _expensesCollection =>
    _firestore.collection('expenses');

Stream<List<Expense>> get expenseStream => _expensesCollection
    .where('uid', isEqualTo: currentUid)
    .snapshots()
    .map((snapshot) => snapshot.docs)
    .map((docs) => docs.map((doc) => Expense.fromDocument(doc)).toList());

Future<bool> createExpense(
  String name,
  String description,
  double amount,
) async {
  try {
    await _expensesCollection.add({
      'uid': currentUid,
      'name': name,
      'description': description,
      'amount': amount,
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
