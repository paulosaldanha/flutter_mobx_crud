import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:estruturabasica/src/screens/transaction/transaction_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceService {
  final TransactionMpos transactionMpos;
  TransactionMposController transactionController = TransactionMposController();

  BluetoothDeviceService(this.transactionMpos) {
    bluetoothConnectionState();
  }

  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];
    bool deviceON = false;

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }
    for (BluetoothDevice paxDevice in devices) {
      if (paxDevice.name.contains('PAX')) {
        transactionMpos.setDeviceName(paxDevice.name);
        deviceON = true;
      }
    }
    if(deviceON){

    }

  }
}
