import 'package:ecommerceBankPay/src/api/api.dart';
import 'package:ecommerceBankPay/src/dto/transaction_link_dto.dart';
import 'package:mobx/mobx.dart';
import 'package:ecommerceBankPay/src/models/transaction_link.dart';
import 'package:ecommerceBankPay/src/services/transaction_service.dart';

part 'link_controller.g.dart';

class LinkController = _LinkController with _$LinkController;

abstract class _LinkController with Store {
  TransactionService transactionService = TransactionService(Api());
  TransactionLink link = TransactionLink();

  @observable
  String validDate = "";

  @action
  setValidDate(String value) => validDate = value;

  @computed
  bool get isLoadingRequestCreate =>
      requestCreate.status == FutureStatus.pending;

  @observable
  ObservableFuture<TransactionLinkDto> requestCreate = ObservableFuture.value(null);

  @computed
  bool get validName =>
      link.name != null && link.name.length >= 4 && link.name.length <= 60;

  String get nameError {
    if (link.name == null || validName) {
      return null;
    } else if (link.name != null && link.name.isEmpty) {
      return "Nome obrigatório";
    } else {
      return "Nome deve conter entre 4 e 60 caracteres";
    }
  }

  bool get validInstallments =>
      int.parse(link.installments) >= 1 && int.parse(link.installments) <= 12;

  String get installmentsError {
    if (link.installments != null || validInstallments) {
      return null;
    } else {
      return "Número de parcelas deve ser no mínimo 1 e no máximo 12";
    }
  }

  @computed
  bool get validDateExpiration => link.dateExpiration.isAfter(DateTime.now());

  void dateExpirationError() {
    if (!link.dateExpiration.isAfter(DateTime.now())) {
      setValidDate("Vencimento precisa de pelo menos 1 dia");
    } else {
      setValidDate("");
    }
  }

  @computed
  bool get isValid {
    return validName && validInstallments && validDateExpiration && !isLoadingRequestCreate;
  }

void createTransctionLink() async {
    try {
      requestCreate = transactionService
          .createTransactionLink(link)
          .asObservable();
    } catch (e) {
      print(e);
    }
  }
}
