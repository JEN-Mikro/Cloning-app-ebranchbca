import 'package:cloud_firestore/cloud_firestore.dart';

class TransferKeBankLainTransaction {
  final String id;
  final String nomorRekeningPenerima;
  final String namaPenerima;
  final int nominalTransfer;
  final String berita;
  final String alamat;
  final String tipeNasabah;
  final String statusPenduduk;
  final String bankTujuan;
  final DateTime timestamp;
  final String nomorReferensi;

  TransferKeBankLainTransaction({
    required this.id,
    required this.nomorRekeningPenerima,
    required this.namaPenerima,
    required this.nominalTransfer,
    required this.berita,
    required this.alamat,
    required this.tipeNasabah,
    required this.statusPenduduk,
    required this.bankTujuan,
    required this.timestamp,
    required this.nomorReferensi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomorRekeningPenerima': nomorRekeningPenerima,
      'namaPenerima': namaPenerima,
      'nominalTransfer': nominalTransfer,
      'berita': berita,
      'alamat': alamat,
      'tipeNasabah': tipeNasabah,
      'statusPenduduk': statusPenduduk,
      'bankTujuan': bankTujuan,
      'timestamp': Timestamp.fromDate(timestamp),
      'nomorReferensi': nomorReferensi,
    };
  }

  factory TransferKeBankLainTransaction.fromMap(Map<String, dynamic> map) {
    return TransferKeBankLainTransaction(
      id: map['id'],
      nomorRekeningPenerima: map['nomorRekeningPenerima'],
      namaPenerima: map['namaPenerima'],
      nominalTransfer: map['nominalTransfer'],
      berita: map['berita'],
      alamat: map['alamat'],
      tipeNasabah: map['tipeNasabah'],
      statusPenduduk: map['statusPenduduk'],
      bankTujuan: map['bankTujuan'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      nomorReferensi: map['nomorReferensi'],
    );
  }
}
