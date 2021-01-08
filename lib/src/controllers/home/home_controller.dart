import 'package:estruturabasica/src/models/transaction.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController();

  @observable
  double sizeCard = 200;

  @observable
  String walletValue;

  @observable
  List<Transaction> transactions = List();

  @action
  setSizeCard() {
    if (sizeCard == 200) {
      sizeCard = 340;
    } else {
      sizeCard = 200;
    }
  }

  Future<dynamic> getWallet() async {
    var res = await getWalletValue();
    if (res == 'false') {
      return res;
    }
    walletValue =
        res['montanteCarteira'].toStringAsFixed(2).replaceAll('.', ',');
    res['ultimasTransacoes'].forEach((element) {
      transactions.add(Transaction.fromMap(element));
    });
    return transactions;
  }
}
