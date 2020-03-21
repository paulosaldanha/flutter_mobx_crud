import 'package:estruturabasica/src/models/estado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//widget para a listagem de estado
class EstadoListaWidget extends StatelessWidget {
  final Estado estado;
  final Function removeClicked;
  final Function updateClicked;
  // recebe um estado, uma ação para quando clicar em remover e atualizar
  const EstadoListaWidget({Key key, this.estado,this.removeClicked,this.updateClicked}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Observer(
      builder: (_) {
      // return  ListTile(
      //   title: Text(estado.nome),
      //   leading: Checkbox(
      //     value: true, 
      //     onChanged: (bool value){},
      //   ),
      //   trailing: IconButton(
      //     color: Colors.red,
      //     icon: Icon(Icons.remove_circle), 
      //     onPressed: removeClicked,
      //   ),
        
      // );
      return Row(
        children: <Widget>[
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(estado.nome),
                )
            ),
            Expanded(
                flex: 2,
                child: IconButton(
                alignment: Alignment.topRight,
                tooltip: "Atualiza",
                icon: Icon(Icons.edit), 
                onPressed: updateClicked,
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                color: Colors.red,
                alignment: Alignment.topRight,
                tooltip: "Deleta",
                icon: Icon(Icons.delete), 
                onPressed: removeClicked,
              ),
            ),
          ],
        );
      },
    );
  }
}