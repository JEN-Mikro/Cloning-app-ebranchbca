import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void createTransaction(Map<String, dynamic> transactionData) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    String uid = user.uid;
    transactionData['uid'] = uid; 

    await FirebaseFirestore.instance
        .collection('transactions')
        .add(transactionData);
  }
}
