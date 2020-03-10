import 'package:estruturabasica/src/components/alert_confirm.dart';
import 'package:estruturabasica/src/components/pais_lista_widget.dart';
import 'package:estruturabasica/src/controllers/pais_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:estruturabasica/src/screens/pais/pais_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final paisController = PaisController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:TextField(
          onChanged: paisController.setFilter,
          decoration: InputDecoration(hintText: "Pesquisa..."),
        )
      ),
      body: Observer(
        builder: (_) {
          return paisController.listFiltered != null ? ListView.builder(
            itemCount: paisController.listFiltered.length,
            itemBuilder: (_,index){
              var item = paisController.listFiltered[index];
              return PaisListaWidget(
                pais: item, 
                removeClicked: () async {
                  var retorno = await showAlertConfirm(context, "Deseja Excluir?","Confirmar Exclusão");
                  if(retorno == 1){
                    paisController.removeItem(item);
                  }
                },
                updateClicked: (){
                  Navigator.of(context).pushNamed(CadPaisViewRoute,arguments: item);
                },
              );
            },
            )
            : Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            /*Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => PaisForm()),
            );*/
            Navigator.of(context).pushNamed(CadPaisViewRoute);
          },
        ),
    );
  }
  
}