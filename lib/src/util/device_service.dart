import 'dart:async';
import 'dart:convert';

import 'package:ecommerceBankPay/src/api/api.dart';
import 'package:ecommerceBankPay/src/controllers/transaction/mpos/transaction_modal_controller.dart';
import 'package:ecommerceBankPay/src/models/auth_model.dart';
import 'package:ecommerceBankPay/src/routes/routing_constants.dart';
import 'package:ecommerceBankPay/src/services/transaction_service.dart';
import 'package:ecommerceBankPay/src/util/authMap.dart';
import 'package:pagarme_mpos_flutter/pagarme_mpos_flutter.dart';
import 'package:flutter/material.dart';

class DeviceService {
  //TESTE
  // String apiKey = 'ak_test_ED7pkGAn73iTqzsEUAQxNK5J5GfFg6';
  // String encryptionKey = 'ek_test_b7DwzjOUXMWGXZq2A3qqBGd0vQxjDt';
  //PROD.
  String apiKey = 'ak_live_ziZ8rx6kvDtbeedxRAJtA9Yyc5sAZk';
  String encryptionKey = 'ek_live_MVoijflgvJcm7Nz2RHiyoCwuvogLqo';

  TransactionService transactionService = TransactionService(Api());

  PagarmeMpos mpos = new PagarmeMpos();
  String transactionStatus;
  int amount;
  int installments;
  PaymentMethod paymentMethod;
  String deviceName;
  TransactionModalController status;
  double currentValues;
  var context;

  DeviceService(
      {this.deviceName,
      this.amount,
      this.installments,
      this.paymentMethod,
      this.status,
      this.currentValues,
      this.context}) {
    enableListeners();
    this.mpos.createMpos(this.deviceName, this.encryptionKey);
    this.mpos.events.listen((data) => {print(data)});
    this.mpos.openConnection(true);
  }

  void enableListeners() {
    mpos.events.listen((data) => this.addListeners(data));
  }

  void addListeners(data) {
    if (data != null) {
      if (data['method'] == 'onBluetoothConnected') {
        status.setTitleStatus('Bluetooth Connectado...');

        mpos.initialize();
        return;
      }

      if (data['method'] == 'onBluetoothDisconnected') {
        status.setImgStatus('images/fail.png');
        status.setTitleStatus('Conexão com bluetooth perdida!');
        setTransactionStatus('Lost bluetooth connection...');
        return;
      }

      if (data['method'] == 'onBluetoothErrored') {
        status.setImgStatus('images/fail.png');
        status.setTitleStatus(
            'Ocorreu algum erro feche a janela é tente novamente!');
        Timer(Duration(seconds: 2), () {
          status.setTitleStatus('Carregando...');
          Navigator.pop(context);
          Navigator.of(context).pushNamed(TransactionCardMpos);
        });
        setTransactionStatus('An error ocurred ${data['value']}');
        return;
      }

      if (data['method'] == 'onReceiveInitialization') {
        mpos.downloadEmvTablesToDevice(false);
        setTransactionStatus('Checking for emv table updates...');
        status.setTitleStatus('Aguarde processando...');
        mpos.displayText('Aguarde processando...');
        return;
      }

      if (data['method'] == 'onReceiveNotification') {
        print('[${this.deviceName}] Sent notification: ${data['value']}');
        return;
      }

      if (data['method'] == 'onReceiveTableUpdated') {
        setTransactionStatus('Emv tables are up to date. Insert card...');
        status.setImgStatus('images/card.png');
        status.setTitleStatus('Inserir o cartão...');
        mpos.payAmount(this.amount, this.paymentMethod);

        return;
      }

      if (data['method'] == 'onReceiveCardHash') {
        mpos.displayText('PROCESSANDO...');
        status.setTitleStatus('Processando...');
        setTransactionStatus('Received card hash. Creating transaction...');
        createTransaction(data['value']);
        return;
      }

      if (data['method'] == 'onReceiveError') {
        setTransactionStatus(null);
        status.setImgStatus('images/fail.png');
        status.setTitleStatus(
            'Ocorreu algum erro feche a janela é tente novamente!');
        Timer(Duration(seconds: 2), () {
          status.setTitleStatus('Carregando...');
          Navigator.pop(context);
          Navigator.of(context).pushNamed(TransactionCardMpos);
        });
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
      }
    }
  }

  void createTransaction(String jsonResult) async {
    dynamic result = json.decode(jsonResult);
    Auth auth = await AuthMap.getAuthMap();
    Map<String, Object> metadata1 = Map();
    metadata1["nome_cliente"] = auth.name;
    metadata1["document"] = 0;
    metadata1["valor_pago_cliente"] = amount / 100;
    metadata1["valor_pago_empresa"] = currentValues;
    metadata1["usuario_id"] = auth.userId;
    metadata1["estabelecimento_id"] = auth.companyId;
    Map<String, Object> metadata = Map();
    metadata["ecommerce_bank"] = metadata1;

    try {
      dynamic mposTransaction = await transactionService.createTransaction({
        'amount': amount.toString(),
        'installments': installments.toString(),
        'api_key': this.apiKey,
        'card_hash': result['cardHash'],
        'metadata': json.encode(metadata),
        'postback_url': 'http://ecommercebank.tk/ecommerce/api/webhook/pagarme',
      });
      if (mposTransaction['status'] == 'paid') {
        onTransactionSuccess(mposTransaction);
      } else {
        onTransactionError(mposTransaction);
      }
    } catch (error) {
      onTransactionError(error);
      setTransactionStatus(null);
    }
  }

  void setTransactionStatus(String status) {
    this.transactionStatus = status;
    print(status);
  }

  void onTransactionSuccess(transaction) {
    status.setImgStatus('images/approve.png');
    status.setTitleStatus('Pagamento Aprovado');
    mpos.displayText("Pagamento Aprovado");
    mpos.close("TRANSACAO APROVADA - RETIRE O CARTAO");
    Timer(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.of(context).pushNamed(HomeViewRoute);
    });
  }

  void onTransactionError(transaction) {
    status.setImgStatus('images/fail.png');
    status.setTitleStatus('Pagamento Recusado');
    mpos.displayText('Pagamento Recusado');
    mpos.close("TRANSACAO RECUSADA - RETIRE O CARTAO");
    Timer(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.of(context).pushNamed(HomeViewRoute);
    });
  }
}
