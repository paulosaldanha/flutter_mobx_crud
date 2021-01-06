
class StatusTransaction {
  static String getStatusTransaction(int status){
    switch (status) {
      case 2:
        return 'PAGO';
      case 10:
        return 'RECUSADO';
      case 5:
        return 'EM PROCESSO ';
      case 8:
        return 'ESTORNADO  ';
      default:
        return 'RECUSADO';
    }
  }
}

