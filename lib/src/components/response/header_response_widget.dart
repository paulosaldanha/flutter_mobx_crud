import 'package:flutter/material.dart';

class HeaderResponseWidget extends StatelessWidget {
  final response;
  final error;
  final method;
  String message = "";
  String valorTotal = "";

  HeaderResponseWidget(this.response, this.error, this.method);

  @override
  Widget build(BuildContext context) {
    if(!error) {
      if (method == "boleto") {
        message = "Boleto\ngerado com sucesso";
        valorTotal =
            response["valorBruto"].toStringAsFixed(2).replaceAll(".", ",");
      } else if (method == "link") {
        message = "Link de Pagamento\ngerado com sucesso";
        valorTotal = response["valor"].toStringAsFixed(2).replaceAll(".", ",");
      } else {
        message = "Transação efetuada\ncom sucesso";
        valorTotal = response["valor"].toStringAsFixed(2).replaceAll(".", ",");
      }
    }else{
      message = "Ocorreu algum falha no servidor tente mais tarde!";
    }

    return Container(
      width: 1000,
      height: 250,
      color: (error) ? Colors.red[900] : Colors.lightGreen,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 30),
        Text((error) ? "Ocorreu um erro" : message,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center),
        SizedBox(height: 30),
        (error)
            ? Text("")
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Total: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                Text("R\$ " + valorTotal,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ]),
      ]),
    );
  }
}
