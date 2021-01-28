import 'package:estruturabasica/src/components/custom_icon_button.dart';
import 'package:estruturabasica/src/controllers/transaction/online/transaction_online_controller.dart';
import 'package:estruturabasica/src/models/transaction_online.dart';
import 'package:estruturabasica/src/screens/transaction/online/transaction_online_form_part2.dart';
import 'package:estruturabasica/src/components/fields.dart';
import 'package:estruturabasica/src/components/mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TransactionOnlineForm extends StatelessWidget {
  final transactionOnline = TransactionOnline();
  TransactionOnlineController transactionOnlineController =
      TransactionOnlineController();

  TransactionOnlineForm();

  MaskTextInputFormatter maskDDD = maskDdd();
  MaskTextInputFormatter maskTelephone = maskPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 74, 173, 1),
        title: Text('Criar transação online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              labelFieldRequired("Documento"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return numberMaskField(
                    mask: transactionOnlineController.maskDocument,
                    suffix: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child : Material(
                        color: Colors.transparent,
                        child : InkWell(
                          child : Container(
                            padding: EdgeInsets.all(5),
                            color:  Color.fromRGBO(0, 74, 173, 1),
                            height: 30,
                            width: 85,
                            child: !transactionOnlineController.loading ?Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Buscar",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),),
                                Icon(Icons.search,
                                    color: Colors.white)
                              ],
                            ): Center(
                              child: Container(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          onTap: transactionOnlineController.getUserThink,
                        ),
                      ),
                    ),
                    onChanged: transactionOnlineController
                        .transactionOnline.setDocument,
                    errorText: transactionOnlineController.documentError,
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              labelFieldRequired("Nome"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return transactionOnlineController.userThink != null &&
                          transactionOnlineController.userThink.name != ""
                      ? Text(
                          transactionOnlineController.userThink.name,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        )
                      : textField(
                          onChanged: transactionOnlineController
                              .transactionOnline.setNome,
                          errorText: transactionOnlineController.nameError,
                        );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelFieldRequired("DDD"),
                          SizedBox(height: 5),
                          Observer(
                            builder: (_) {
                              return transactionOnlineController.userThink !=
                                          null &&
                                      transactionOnlineController
                                              .userThink.ddd !=
                                          ""
                                  ? Text(
                                      transactionOnlineController.userThink.ddd,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : numberMaskField(
                                      mask: maskDDD,
                                      initialValue: transactionOnlineController
                                          .transactionOnline.ddd,
                                      onChanged: transactionOnlineController
                                          .transactionOnline.setDdd,
                                      errorText:
                                          transactionOnlineController.dddError);
                            },
                          ),
                        ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelFieldRequired("Telefone"),
                          SizedBox(height: 5),
                          Observer(
                            builder: (_) {
                              return transactionOnlineController.userThink !=
                                          null &&
                                      transactionOnlineController
                                              .userThink.phone !=
                                          ""
                                  ? Text(
                                      transactionOnlineController
                                          .userThink.phone,
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : numberMaskField(
                                      mask: maskTelephone,
                                      onChanged: transactionOnlineController
                                          .transactionOnline.setTelephone,
                                      errorText: transactionOnlineController
                                          .telephoneError,
                                    );
                            },
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              labelFieldRequired("Email"),
              SizedBox(height: 5),
              Observer(
                builder: (_) {
                  return textField(
                    onChanged:
                        transactionOnlineController.transactionOnline.setEmail,
                    errorText: transactionOnlineController.emailError,
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 1000,
                color: Colors.white,
                child: Observer(
                  builder: (_) {
                    return FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Color.fromRGBO(0, 74, 173, 1)),
                      ),
                      color: Colors.white,
                      textColor: Color.fromRGBO(0, 74, 173, 1),
                      padding: EdgeInsets.all(10.0),
                      onPressed: transactionOnlineController.isValid
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      TransactionOnlineFormPart2(
                                          transactionOnline,
                                          transactionOnlineController)));
                            }
                          : null,
                      child: Text(
                        "Continuar".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
