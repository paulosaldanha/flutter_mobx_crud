import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/dto/transaction_wallet_dto.dart';
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


  @computed
  bool get isLoading => request.status == FutureStatus.pending;

  @observable
  ObservableFuture<TransactionWalletDto> request = ObservableFuture.value(null);

  @action
  setSizeCard() {
    if (sizeCard == 200) {
      sizeCard = 340;
    } else {
      sizeCard = 200;
    }
  }

  Future<void> getWallet() async {
    try{
      request = transactionService
          .getWalletValue()
          .asObservable();

    }catch(e){
      print(e);
    }

  }
}
