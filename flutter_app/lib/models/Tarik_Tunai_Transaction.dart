import 'package:cloud_firestore/cloud_firestore.dart';

class TarikTunaiTransaction {
  final String id;
  final String nomorRekening;
  final int jumlahTarikan;
  final DateTime waktuTransaksi;
  final String nomorReferensi;

  TarikTunaiTransaction({
    required this.id,
    required this.nomorRekening,
    required this.jumlahTarikan,
    required this.waktuTransaksi,
    required this.nomorReferensi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomorRekening': nomorRekening,
      'jumlahTarikan': jumlahTarikan,
      'waktuTransaksi': Timestamp.fromDate(waktuTransaksi),
      'jenisTransaksi': 'Tarik Tunai',
      'nomorReferensi': nomorReferensi,
    };
  }

  factory TarikTunaiTransaction.fromMap(Map<String, dynamic> map) {
    return TarikTunaiTransaction(
      id: map['id'],
      nomorRekening: map['nomorRekening'],
      jumlahTarikan: map['jumlahTarikan'],
      waktuTransaksi: (map['waktuTransaksi'] as Timestamp).toDate(),
      nomorReferensi: map['nomorReferensi'],
    );
  }

  factory TarikTunaiTransaction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TarikTunaiTransaction(
      id: data['id'],
      nomorRekening: data['nomorRekening'],
      jumlahTarikan: data['jumlahTarikan'],
      waktuTransaksi: (data['waktuTransaksi'] as Timestamp).toDate(),
      nomorReferensi: data['nomorReferensi'],
    );
  }
}
