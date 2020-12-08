import '../services/transaction_service.dart' as transaction;

class TaxaMethodPaymentService {

  static String convertToString(List values) {
    String val = '';
    for (int i = 0; i < values.length; i++) {
      val += values[i];
    }
    double realCurrent = int.parse(val) / 100;
    return realCurrent.toStringAsFixed(2).replaceAll('.', ',');
  }

  static Future<List> convertCurrentValueAndAmountCredit(String current) async {
    try {
      return await transaction.getTaxa(current.replaceAll(',', '.'));
    } catch (error) {
      print(error);
    }
  }

  static Future<int> convertCurrentValueAndAmountDebit(String current) async {
    try {
      dynamic taxaTransaction =
          await transaction.getTaxa(current.replaceAll(',', '.'));
      int currentInt = (taxaTransaction[0] * 100).toInt();
      return currentInt;
    } catch (error) {
      print(error);
    }
  }

}
