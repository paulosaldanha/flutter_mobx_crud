import 'package:ecommerceBankPay/src/api/api.dart';
import 'package:ecommerceBankPay/src/services/transaction_service.dart';
import 'package:intl/intl.dart';


class TaxMethodPaymentService {
  TransactionService transactionService = TransactionService(Api());

  static String convertToString(List values) {
    String val = '';
    for (int i = 0; i < values.length; i++) {
      val += values[i];
    }
    double realCurrent = int.parse(val) / 100;
    return realCurrent.toStringAsFixed(2).replaceAll('.', ',');
  }

  static String moneyPtBr( value){
    final oCcy = new NumberFormat("#,##0.00", "pt_BR");
    return oCcy.format(value).toString();
  }

   Future<List> convertCurrentValueAndAmountCredit(String current) async {
    try {
      return await transactionService.getTax(current.replaceAll(',', '.'), 3);
    } catch (error) {
      print(error);
    }
  }

    Future<List> convertCurrentValueAndAmountDebit(String current) async {
    try {
      return await transactionService.getTax(current.replaceAll(',', '.'), 2);
    } catch (error) {
      print(error);
    }
  }

}
