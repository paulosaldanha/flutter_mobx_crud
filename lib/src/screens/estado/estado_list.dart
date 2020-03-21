import 'package:estruturabasica/src/components/alert_confirm.dart';
import 'package:estruturabasica/src/components/estado_lista_widget.dart';
import 'package:estruturabasica/src/controllers/estado_controller.dart';
import 'package:estruturabasica/src/routes/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class EstadoListPage extends StatefulWidget {
  @override
  _EstadoListPageState createState() => _EstadoListPageState();
}

class _EstadoListPageState extends State<EstadoListPage> {
  final estadoController = EstadoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:TextField(
          onChanged: estadoController.setFilter,
          decoration: InputDecoration(hintText: "Pesquisa..."),
        )
      ),
      body: Observer(
        builder: (_) {
          //retorna lista de estado se for diferente de null
          return estadoController.listFiltered != null ? ListView.builder(
            itemCount: estadoController.listFiltered.length,
            itemBuilder: (_,index){
              var item = estadoController.listFiltered[index];
              return EstadoListaWidget(
                estado: item, 
                removeClicked: () async {
                  var retorno = await showAlertConfirm(context, "Deseja Excluir?","Confirmar Exclusão");
                  if(retorno == 1){
                    estadoController.removeItem(item);
                  }
                },
                updateClicked: (){
                  Navigator.of(context).pushNamed(CadEstadoViewRoute,arguments: item);
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
            Navigator.of(context).pushNamed(CadEstadoViewRoute);
          },
        ),
    );
  }
  
}