import 'package:estruturabasica/src/models/estado.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:estruturabasica/src/controllers/estado_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class EstadoForm extends StatelessWidget{
  final Estado estado;
  final estadoController = EstadoController();

  //constructor
  EstadoForm({Key key, this.estado}):super(key:key){
   
  }
  
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
    if(estado != null){
      estadoController.estado = estado;
    }
    String initialValue = estadoController.estado.pais.nome != null ? estadoController.estado.pais.nome : null;
    final TextEditingController _typeAheadPais = TextEditingController(text: initialValue);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Estado'),
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
                    onChanged: estadoController.estado.setNome,
                    errorText: estadoController.validateNome,
                    initalValue: estadoController.estado.nome
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "UF",
                    onChanged: estadoController.estado.setUf,
                    errorText: estadoController.validateUf,
                    initalValue: estadoController.estado.uf
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              Observer(
                builder: (_){ print(estadoController.listFilteredPais);
                  return TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      autofocus: false,
                      controller: _typeAheadPais,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pais'
 
                      )
                    ),
                    suggestionsCallback: (pattern) {
                      return estadoController.listFilteredPais;
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.flag),
                        title: Text(suggestion.name),
                        subtitle: Text(suggestion.sigla),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      print("onselected");
                      print(suggestion);
                      estadoController.estado.pais = suggestion;
                      _typeAheadPais.text = estadoController.estado.pais.nome;
                    },
                    //initialValue: _typeAheadPais.text,
                    onSaved: (value) => estadoController.pattern = value, 
                  );
                },
              ),
              SizedBox(
                height: 18,
              ),
              Observer(
                builder: (_){
                  return RaisedButton(
                          onPressed: estadoController.isValid ? () {
                            estadoController.add();
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