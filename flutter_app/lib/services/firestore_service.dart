import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTransaksiTarikTunai(Map<String, dynamic> transaksi) async {
    try {
      await _db.collection('transaksi').add(transaksi);
      print('Transaction saved successfully');
    } catch (e) {
      print('Error saving transaction: $e');
      throw e;
    }
  }

  Future<void> saveFormPenerima(Map<String, dynamic> data) async {
    try {
      await _db.collection('FormPenerima').add(data);
      print('Form penerima saved successfully');
    } catch (e) {
      print('Error saving form penerima: $e');
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getTransaksiTarikTunaiList() async {
    try {
      final snapshot = await _db
          .collection('transaksi')
          .where('jenisTransaksi', isEqualTo: 'Tarik Tunai')
          .get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error getting transaction list: $e');
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getFormPenerimaList() async {
    try {
      final snapshot = await _db.collection('FormPenerima').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error getting form penerima list: $e');
      throw e;
    }
  }

  Future<void> updateTransactionStatus(String transactionId) async {
    try {
      DocumentReference transactionRef =
          _db.collection('transaksi').doc(transactionId);

      await transactionRef.update({
        'status': 'Berhasil',
      });
      print('Transaction status updated successfully');
    } catch (e) {
      print('Error updating transaction status: $e');
      throw e;
    }
  }
}
