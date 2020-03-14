import 'package:flutter_test/flutter_test.dart';
import 'package:estruturabasica/src/models/pais.dart';

void main(){
  group('Pais', (){
    test('Pais deve ser inicializado', () {
     final pais = Pais.construtorParametro(1,'Brasil','55','Br');
     
     expect(pais.nome, 'Brasil');
   });
   test('Nome de ser setado', () {
     final pais = Pais();
     pais.setNome('Brasil');
     
     expect(pais.nome, 'Brasil');
   });
  });
}