String formatStringWithSpaces(
    String numberString, int chunkSize, String separator) {
  String formattedNumber = '';

  for (int i = 0; i < numberString.length; i += chunkSize) {
    int endIndex = i + chunkSize;
    if (endIndex > numberString.length) {
      endIndex = numberString.length;
    }
    formattedNumber += numberString.substring(i, endIndex);
    if (endIndex < numberString.length) {
      formattedNumber += separator;
    }
  }

  return formattedNumber;
}