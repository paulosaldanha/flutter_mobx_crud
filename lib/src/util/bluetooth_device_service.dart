import 'package:estruturabasica/src/models/transaction_Mpos.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceService {

  final transactionMposController;

  BluetoothDeviceService( this.transactionMposController) {
    bluetoothConnectionState();
  }

  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];
    transactionMposController.setDeviceName(null);

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }
    transactionMposController.setvisibilityModalblueth(true);
    for (BluetoothDevice paxDevice in devices) {
      if (paxDevice.name.contains('PAX')) {
        transactionMposController.setDeviceName(paxDevice.name);
        transactionMposController.setvisibilityModalblueth(false);
      }
    }

  }
}
