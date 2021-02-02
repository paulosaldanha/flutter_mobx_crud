import 'package:estruturabasica/src/controllers/transaction/link/link_controller.dart';
import 'package:estruturabasica/src/controllers/transaction/link/transaction_link_controller.dart';
import 'package:estruturabasica/src/screens/transaction/link/transaction_link_form_part2.dart';
import 'package:estruturabasica/src/components/display_value_widget.dart';
import 'package:estruturabasica/src/components/keyboard_widget.dart';
import 'package:estruturabasica/src/models/transaction_link.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TransactionLinkForm extends StatefulWidget {

  @override
  _TransactionLinkFormState createState() =>
      _TransactionLinkFormState();
}
class _TransactionLinkFormState extends State<TransactionLinkForm> {
  TransactionLink link = TransactionLink();
  LinkController linkController = LinkController();
  TransactionLinkController transactionLinkController =
      TransactionLinkController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 74, 173, 1),
          title: Text('Gerar Link de Pagamento'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 25),
            color: Color.fromRGBO(0, 74, 173, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                   DisplayValueWidget(
                      transactionLinkController, "", false),
                KeyboardWidget(transactionLinkController),
                Container(
                  width: 1000,
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 35),
                  child: Observer(
                    builder: (_) {
                      return FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side:
                              BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                        ),
                        color: Colors.white,
                        textColor: Color.fromRGBO(0, 74, 173, 1),
                        padding: EdgeInsets.all(10.0),
                        onPressed: !transactionLinkController.loading ? () async {
                                String value = transactionLinkController
                                    .currentValues
                                    .replaceAll(",", ".");
                                linkController.link.setValue(value);
                                if(value == "0.00"){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TransactionLinkForm2(
                                          linkController, link, null)));
                                }else{
                                  List parcelas = await transactionLinkController
                                      .getParcelas(value);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TransactionLinkForm2(
                                          linkController, link, parcelas)));
                                }
                              }: null,
                        child:!transactionLinkController.loading? Text(
                          "Continuar".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ):Center(
                          child: CircularProgressIndicator(),
                        )
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
