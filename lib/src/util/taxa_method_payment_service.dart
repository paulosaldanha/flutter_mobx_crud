class TaxaMethodPaymentService{

    static String convertToString(List values) {
    String val = '';
    for (int i = 0;i < values.length;i++) {
      val+=values[i];
    }
    double realCurrent = int.parse(val)/100;

    return realCurrent.toStringAsFixed(2).replaceAll('.', ',');
  }

    static int convertCurrentValueAndAmount( String current, String methodPayment){
      switch (methodPayment) {
        case 'credito':
        // do something
          break;
        case 'debito':
        // do something else
          break;
      }
    double currentInit = double.parse(current.replaceAll(',', '.'));
    int currentInt = (currentInit*100).toInt();
    return currentInt;
  }


}