class FormData {
  final String recipientName;
  final String accountNumber;
  final String amount;
  final String message;
  final String sourceOwnerName;
  final String identityType;
  final String nomorReferensi; 

  FormData({
    required this.recipientName,
    required this.accountNumber,
    required this.amount,
    required this.message,
    required this.sourceOwnerName,
    required this.identityType,
    required this.nomorReferensi, 
  });

  Map<String, dynamic> toMap() {
    return {
      'recipientName': recipientName,
      'accountNumber': accountNumber,
      'amount': amount,
      'message': message,
      'sourceOwnerName': sourceOwnerName,
      'identityType': identityType,
      'nomorReferensi': nomorReferensi, 
    };
  }
}
