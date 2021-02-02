import 'package:estruturabasica/src/models/transaction.dart';
import 'package:mobx/mobx.dart';

part 'transaction_wallet_dto.g.dart';

class TransactionWalletDto = _TransactionWalletDto with _$TransactionWalletDto;

abstract class _TransactionWalletDto with Store {

  @observable
  String valueWallet;

  @action
  void setvalueWallet(String value) => valueWallet = value;

  @observable
  ObservableList<Transaction> transactionList = ObservableList<Transaction>();

  @action
  void settransactionList(List<Transaction> value) => transactionList = value;

  _TransactionWalletDto.fromMap(Map<String, dynamic> map) {
    valueWallet =
        map['montanteCarteira'].toStringAsFixed(2).replaceAll('.', ',') ??
            "0.00";
    for (final t in map['ultimasTransacoes']) {
      transactionList.add(Transaction.fromMap(t));
    }
  }
}
