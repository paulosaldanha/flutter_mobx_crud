import 'package:combos/combos.dart';
import 'package:estruturabasica/src/controllers/transaction/transaction_list_combo_controller.dart';
import 'package:estruturabasica/src/models/tax.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_payment_method.dart';
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
  Widget continueButton = FlatButton(
    child: Text("Confirmar"),
    onPressed: () {
      //Navigator.pop(context,1);
      Navigator.of(context).pop(1);
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Observer(
      builder: (context) {
        return transaction.loading
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
                    title: Text(item.descriptionValue),
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
