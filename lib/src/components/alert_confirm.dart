import 'package:flutter/material.dart';


 Future<int> showAlertConfirm(BuildContext context,String msg,String title) async {

   Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () { 
      Navigator.pop(context,0);
    },
  );
  Widget continuaButton = FlatButton(
    child: Text("Confirmar"),
    onPressed:  () {
      //Navigator.pop(context,1);
      Navigator.of(context).pop(1);
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(msg),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  int r = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  return r;
}

 

