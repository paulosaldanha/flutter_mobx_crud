import 'package:estruturabasica/src/api/api.dart';
import 'package:estruturabasica/src/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:estruturabasica/presentation/ecommerce_bank_pay_icons.dart';

class BodyResponseWidget extends StatelessWidget {
  final response;
  final error;
  final method;
  String mailShare = "";
  String wppShare = "";

  TransactionService transactionService = TransactionService(Api());

  BodyResponseWidget(this.response, this.error, this.method);

  Future<dynamic> baixarBoleto() async {
    dynamic boleto = await transactionService.getBoleto(response.nossoNumero);
    return boleto;
  }

  @override
  Widget build(BuildContext context) {
    if (method == "boleto") {
      if(response.linhaDigitavel == ""){
        mailShare =
        "mailto:?subject=Boleto | E-CommerceBank Pay&body=Aqui está o Boleto de pagamento gerado via E-CommerceBank Pay\n\n";
        wppShare =
        "whatsapp://send?text=Aqui está o boleto gerado via E-CommerceBank Pay\n\n";
      }else{
        mailShare =
        "mailto:?subject=Boleto | E-CommerceBank Pay&body=Aqui está o código de pagamento gerado via E-CommerceBank Pay\n\n";
        wppShare =
        "whatsapp://send?text=Aqui está o código de pagamento gerado via E-CommerceBank Pay\n\n";
      }

    } else if (method == "link") {
      String link = response.linkId;
      mailShare =
          "mailto:?subject=Link de Pagamento | E-CommerceBank Pay&body=Aqui está o Link de Pagamento gerado via E-CommerceBank Pay\n\nhttps://ecommercebank.tk/ecommerce/$link";
      wppShare =
          "whatsapp://send?text=Aqui está o Link de Pagamento gerado via E-CommerceBank Pay\n\nhttps://ecommercebank.tk/ecommerce/$link";
    } else if (method == "transactionOnline") {
      String valorTotal = response.valor.toStringAsFixed(2).replaceAll(".", ",");
      mailShare =
      "mailto:?subject=Cartão | E-CommerceBank Pay&body=Aqui está o comprovante de Pagamento gerado via E-CommerceBank Pay\n\n compra no valor de R\$ $valorTotal";
      wppShare =
      "whatsapp://send?text=Aqui está o Link de Pagamento gerado via E-CommerceBank Pay\n\n compra no valor de R\$ $valorTotal";
    }


    if (error) {
      return Container(
        child: Column(children: [
          Text("Verifique os dados do cartão e tente novamente",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
              textAlign: TextAlign.center)
        ]),
      );
    } else {
      return Container(
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Column(children: [
              IconButton(
                icon: Icon(Ecommerce_bank_pay.mail),
                iconSize: 90,
                color: Color.fromRGBO(0, 74, 173, 1),
                tooltip: 'Enviar por e-mail',
                onPressed: () async {
                  if (method == "boleto") {
                    if (response.linhaDigitavel != "") {
                      launch(mailShare + response.linhaDigitavel);
                    } else {
                      dynamic boleto = await baixarBoleto();
                      launch(mailShare + boleto.toString());
                    }
                  } else {
                    launch(mailShare);
                  }
                },
              ),
              Text("Enviar por \n e-mail",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                  textAlign: TextAlign.center)
            ])),
            Expanded(
                child: Column(children: [
              IconButton(
                icon: Icon(Ecommerce_bank_pay.whatsapp),
                iconSize: 80,
                color: Color.fromRGBO(0, 74, 173, 1),
                tooltip: 'Enviar por WhatsApp',
                onPressed: () async {
                  if (method == "boleto") {
                    if (response.linhaDigitavel != "") {
                      launch(wppShare + response.linhaDigitavel);
                    } else {
                      dynamic boleto = await baixarBoleto();
                      launch(wppShare + boleto.toString());
                    }
                  } else {
                    launch(wppShare);
                  }
                },
              ),
              Text("Enviar por \n WhatsApp",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                  textAlign: TextAlign.center)
            ])),
          ]),
          SizedBox(height: 50)
        ]),
      );
    }
  }
}
