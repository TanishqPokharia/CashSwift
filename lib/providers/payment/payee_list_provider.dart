import 'package:cash_swift/models/cash_swift_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final payeeProvider =
    StateNotifierProvider<PayeeNotifier, List<CashSwiftUser>>((ref) {
  return PayeeNotifier();
});

class PayeeNotifier extends StateNotifier<List<CashSwiftUser>> {
  PayeeNotifier() : super([]);

  Future<void> getPayee(String query) async {
    state = [];

    final userCollection = FirebaseFirestore.instance.collection("users");
    final queryResult = userCollection.where("phoneNumber", isEqualTo: query);
    final payeeList = await queryResult.get();

    if (payeeList.docs.isNotEmpty) {
      final data = payeeList.docs.first.data();

      state = [
        ...state,
        CashSwiftUser(
            name: data['userName'],
            id: data['CSid'],
            balance: double.parse(data['balance'].toString()),
            phoneNumber: data['phoneNumber']),
      ];
      print(state);
    }
  }
}
