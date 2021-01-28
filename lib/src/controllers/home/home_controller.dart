import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/models/transaction.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

 final TransactionService transactionService = TransactionService(Api());

abstract class _HomeController with Store {
  _HomeController(){
    getWallet();
  }

  @observable
  double sizeCard = 200;

  @observable
  String walletValue;

  @observable
  ObservableList<Transaction> transactions = ObservableList<Transaction>();

  @action
  setSizeCard() {
    if (sizeCard == 200) {
      sizeCard = 340;
    } else {
      sizeCard = 200;
    }
  }

  Future<void> getWallet() async {
    var res = await transactionService.getWalletValue();
    if (res == 'false') {
      return res;
    }
    walletValue =
        res['montanteCarteira'].toStringAsFixed(2).replaceAll('.', ',');
    res['ultimasTransacoes'].forEach((element) {
      transactions.add(Transaction.fromMap(element));
    });
  }
}
