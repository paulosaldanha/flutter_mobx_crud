import 'dart:convert';

import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';
import '../services/transaction_service.dart' as transaction;

class DeviceService {

  //TESTE
  String apiKey = 'ak_test_ED7pkGAn73iTqzsEUAQxNK5J5GfFg6';
  String encryptionKey = 'ek_test_b7DwzjOUXMWGXZq2A3qqBGd0vQxjDt';
  //PROD
  // String apiKey = 'ak_live_ziZ8rx6kvDtbeedxRAJtA9Yyc5sAZk';
  // String encryptionKey = 'ek_live_MVoijflgvJcm7Nz2RHiyoCwuvogLqo';

  PagarmeMpos mpos;
  String transactionStatus;
  int amount;
  int installments;
  PaymentMethod paymentMethod;
  String deviceName;

  DeviceService({this.deviceName, this.amount,this.installments, this.paymentMethod, this.mpos}) {
    enableListeners();
    mpos.createMpos(this.deviceName, this.encryptionKey);

    mpos.events.listen((data) => {print(data)});
    mpos.openConnection(true);
  }

  void enableListeners() {
    mpos.events.listen((data) => this.addListeners(data));
  }

  void addListeners(data) {
    if (data != null) {
      if (data['method'] == 'onBluetoothConnected') {
        mpos.initialize();
        return;
      }

      if (data['method'] == 'onBluetoothDisconnected') {
        setTransactionStatus('Lost bluetooth connection...');
        return ;
      }

      if (data['method'] == 'onBluetoothErrored') {
        setTransactionStatus('An error ocurred ${data['value']}');
        return;
      }

      if (data['method'] == 'onReceiveInitialization') {
        mpos.downloadEmvTablesToDevice(false);
        setTransactionStatus('Checking for emv table updates...');
        mpos.displayText('Aguarde processando...');
        return;
      }

      if (data['method'] == 'onReceiveNotification') {
        print('[${this.deviceName}] Sent notification: ${data['value']}');
        return;
      }

      if (data['method'] == 'onReceiveTableUpdated') {
        setTransactionStatus('Emv tables are up to date. Insert card...');
        mpos.payAmount(this.amount, this.paymentMethod);
        return;
      }

      if (data['method'] == 'onReceiveCardHash') {
        mpos.displayText('PROCESSANDO...');
        setTransactionStatus('Received card hash. Creating transaction...');
        createTransaction(data['value']);
        return;
      }

      if (data['method'] == 'onReceiveError') {
        setTransactionStatus(null);
        print('ERROR: An error ocurred: ' + data['value']);
        mpos.close('ERROR - ' + data['value']);
      }

      if (data['method'] == 'onReceiveClose') {
        // TBD
        setTransactionStatus('onReceiveClose');
      }

      if (data['method'] == 'onReceiveOperationCancelled') {
        // TBD
        setTransactionStatus('onReceiveOperationCancelled');
      }

      if (data['method'] == 'onReceiveOperationCompleted') {
        // TBD
        setTransactionStatus('onReceiveOperationCompleted');
      }

      if (data['method'] == 'onReceiveFinishTransaction') {
        setTransactionStatus('onReceiveFinishTransaction');
        mpos.displayText("TRANSACAO CONCLUIDA");
        mpos.close("TRANSACAO CONCLUIDA - RETIRE O CARTAO");
      }
    }
  }

  void createTransaction(String jsonResult) async {
    dynamic result = json.decode(jsonResult);
    Map<String, Object> metadata = Map();
    metadata["nome"] = "Luiz";
    metadata["valor"] = 12.0;
    metadata["id_empresa"] = 29199;
    metadata["id_usuario"] = 37539;
    metadata["documento"] ="09976688903";

    try {
      dynamic mposTransaction = await transaction.createTransaction({
        'amount': amount.toString(),
        'installments': installments.toString(),
        'api_key': this.apiKey,
        'card_hash': result['cardHash'],
        'metadata':json.encode(metadata),
      });
      onTransactionSuccess(
          mposTransaction, result['shouldFinishTransaction'] == 'true');
    } catch (error) {
      onTransactionError(result['shouldFinishTransaction'] == 'true');
      setTransactionStatus(null);
    }
  }

  void setTransactionStatus(String status) {
    this.transactionStatus = status;
    print(status);
  }

  void onTransactionSuccess(transaction, bool shouldFinishTransaction) {
    if (shouldFinishTransaction) {
      mpos.finishTransaction(
          true,
          int.parse(transaction['acquirer_response_code']),
          transaction['card_emv_response']);
    } else {
      mpos.displayText("Pagamento Aprovado");
      mpos.close("TRANSACAO APROVADA - RETIRE O CARTAO");
    }
  }

  void onTransactionError(bool shouldFinishTransaction) {
    if (shouldFinishTransaction) {
      mpos.finishTransaction(false, 0, null);
    } else {
      mpos.displayText('Pagamento Recusado');
      mpos.close("TRANSACAO RECUSADA - RETIRE O CARTAO");
    }

    setTransactionStatus(null);
  }
}
