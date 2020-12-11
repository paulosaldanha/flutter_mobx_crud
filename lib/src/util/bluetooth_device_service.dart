import 'package:estruturabasica/src/controllers/transaction_mpos_controller.dart';
import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceService {
  final TransactionMpos transactionMpos;
  final transactionMposController;

  BluetoothDeviceService(this.transactionMpos, this.transactionMposController) {
    bluetoothConnectionState();
  }

  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];
    transactionMpos.setDeviceName(null);

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }
    transactionMposController.setStatus(0);
    for (BluetoothDevice paxDevice in devices) {
      if (paxDevice.name.contains('PAX')) {
        transactionMpos.setDeviceName(paxDevice.name);
      }
    }
    transactionMposController.setStatus(1);
  }
}
