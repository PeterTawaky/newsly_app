String? getFirstTwoWords(String? text) {
  if (text == null) {
    return null;
  }
  return text.substring(0, 2);
}
