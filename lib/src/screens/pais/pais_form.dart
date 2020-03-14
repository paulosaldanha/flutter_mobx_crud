import 'package:estruturabasica/src/models/pais.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/controllers/pais_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PaisForm extends StatelessWidget{
  final Pais pais;
  final paisController = PaisController();

  //constructor
  PaisForm({Key key, this.pais}):super(key:key);
  
   //definição do textformfield
  _textField({String labelText, onChanged, String Function() errorText,String initalValue}){
    return TextFormField(
      onChanged: onChanged,
      initialValue: initalValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(pais != null){
      paisController.pais = pais;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Pais'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "Nome",
                    onChanged: paisController.pais.setNome,
                    errorText: paisController.validateNome,
                    initalValue: paisController.pais.nome
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "DDI",
                    onChanged: paisController.pais.setDdi,
                    errorText: paisController.validateDdi,
                    initalValue: paisController.pais.ddi
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "Sigla",
                    onChanged: paisController.pais.setSigla,
                    errorText: paisController.validateSigla,
                    initalValue: paisController.pais.sigla
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              Observer(
                builder: (_){
                  return RaisedButton(
                          onPressed: paisController.isValid ? () {
                            paisController.add();
                            Navigator.pop(context);
                             Flushbar(
                              title: "Sucesso",
                              message: "Operação realizada com sucesso!",
                              duration: Duration(seconds: 2),
                            )..show(context);
                          } : null,
                          child: Text("Salvar"),
                        ); 
                },
              ),
            ],
          ),
        ), 
      ),
    );
  }

  

}