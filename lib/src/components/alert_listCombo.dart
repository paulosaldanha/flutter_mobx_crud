import 'package:combos/combos.dart';
import 'package:ecommerceBankPay/src/controllers/auth/auth_controller.dart';
import 'package:ecommerceBankPay/src/controllers/transaction/mpos/transaction_list_combo_controller.dart';
import 'package:ecommerceBankPay/src/models/tax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Future<int> showAlertConfirmListCombo(BuildContext context, String title,
    TransactionListComboController transaction, String method) async {
  Widget cancelButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context, 0);
    },
  );
  Widget continueButton = Observer(builder: (_) {
    return FlatButton(
      child: Text("Confirmar"),
      onPressed: transaction.selectedString != "SELECIONE UM PARCELA"
          ? () {
              Navigator.of(context).pop(1);
            }
          : null,
    );
  });
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Observer(
      builder: (context) {
        final authController = AuthController();
        return transaction.isLoading
            ? Container(
                height: 70,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListCombo<Tax>(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(transaction.selectedString != null
                        ? transaction.selectedString
                        : "SELECIONE UM PARCELA")),
                getList: () => method == 'credito'
                    ? transaction.amountValuesCreditCardList
                    : transaction.amountValuesDebitCardList,
                itemBuilder: (_, parameters, item) {
                  return ListTile(
                    title: Text('${item.installments}x de ${item.descriptionValue}'),
                  );
                },
                onItemTapped: (value) {
                  transaction.selectedState(value);
                });
      },
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  //exibe o diálogo. Await para pegar a ação
  int r = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  //retorna 0 ou 1
  return r;
}
