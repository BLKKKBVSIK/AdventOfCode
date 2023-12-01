import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  int getDigitsFromString(String element) {
    late int twoDigitsNumber;

    final onlyDigit = element.replaceAll(new RegExp(r'[^0-9]'), '');
    if (onlyDigit.length > 1) {
      twoDigitsNumber = int.parse(
          onlyDigit.substring(0, 1) + onlyDigit.substring(onlyDigit.length - 1, onlyDigit.length));
    } else {
      twoDigitsNumber = int.parse(onlyDigit + onlyDigit);
    }

    return twoDigitsNumber;
  }

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int result = 0;
    for (var element in input.getPerLine()) {
      result += getDigitsFromString(element);
    }

    return result;
  }

  @override
  int solvePart2() {
    List<String> digits = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

    int result = 0;
    for (var element in input.getPerLine()) {
      String newElement = element;

      digits.forEach((digit) {
        while (newElement.contains(digit)) {
          for (digit in digits) {
            while (newElement.contains(digit)) {
              if (newElement.contains(digit)) {
                final digitFoundPos = newElement.indexOf(digit);
                newElement = newElement.replaceRange(
                  digitFoundPos + 1,
                  digitFoundPos + 2,
                  (digits.indexOf(digit) + 1).toString(),
                );
              }
            }
          }
        }
      });

      result += getDigitsFromString(newElement);

      print(newElement + ': ' + getDigitsFromString(newElement).toString());
    }

    return result;
  }
}
