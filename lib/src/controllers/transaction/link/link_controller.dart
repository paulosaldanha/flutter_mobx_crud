import 'package:mobx/mobx.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';

part 'link_controller.g.dart';

class LinkController = _LinkController with _$LinkController;

abstract class _LinkController with Store {
  _LinkController();

  var link = TransactionLink();

  @observable
  String validDate = "";
  @action
  setValidDate(String value) => validDate = value;

  @observable
  bool loading = false;

  // Validação de Nome
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
      ;
    }
  }

  // Validação de parcelas
  bool get validInstallments =>
      int.parse(link.installments) >= 1 && int.parse(link.installments) <= 12;
  String get installmentsError {
    if (link.installments != null || validInstallments) {
      return null;
    } else {
      return "Número de parcelas deve ser no mínimo 1 e no máximo 12";
    }
  }

  //validador de Vencimento
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
    return validName && validInstallments && validDateExpiration && !loading;
  }

  dynamic createTransctionLink() async {
    return createTransactionLink(link);
  }
}
