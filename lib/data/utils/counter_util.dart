class CounterUtil {
  static String shortValue(int value) {
    final rightHand = [1000000000, 1000000, 1000];
    final letters = ['B', 'M', 'K'];
    var i = 0;
    for (var operand in rightHand) {
      if (value > operand && (value / operand) > 0) {
        return (value / operand).toInt().toString() + letters[i];
      }
      i++;
    }

    return value.toString();
  }
}
