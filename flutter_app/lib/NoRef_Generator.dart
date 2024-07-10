import 'dart:math';

class ReferenceGenerator {
  static String generateReference(String transactionType) {
    String randomPart = Random().nextInt(100000).toString().padLeft(5, '0');

    String prefix;
    switch (transactionType.toLowerCase()) {
      case 'tarik_tunai':
        prefix = 'TS';
        break;
      case 'setoran_tunai':
        prefix = 'ST';
        break;
      case 'transfer_bank':
        prefix = 'TKBL';
        break;
      default:
        throw Exception('Unsupported transaction type');
    }

    return '$prefix$randomPart';
  }
}
