// import "dart:num";

String fmtBalance(String amount) {
  if (double.parse(amount) < 0) {
    String withoutNegativeSign = amount.substring(1, amount.length);
    String formattedBal = "-GHS$withoutNegativeSign";
    return formattedBal;
  } else {
    return "GHS$amount";
  }
}
