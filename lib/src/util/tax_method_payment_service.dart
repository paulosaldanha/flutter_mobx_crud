import '../services/transaction_service.dart' as transaction;

class TaxMethodPaymentService {

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
      return await transaction.getTax(current.replaceAll(',', '.'), 3);
    } catch (error) {
      print(error);
    }
  }

  static  Future<List> convertCurrentValueAndAmountDebit(String current) async {
    try {
      return await transaction.getTax(current.replaceAll(',', '.'), 2);
    } catch (error) {
      print(error);
    }
  }

}
