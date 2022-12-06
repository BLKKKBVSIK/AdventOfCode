import '../utils/index.dart';

class Day06 extends GenericDay {
  Day06() : super(6);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int score = 0;

    for (int i = 0; i < input.asString.length; i++) {
      final setLetters = input.asString.substring(i, i + 4).split('').toSet();
      if (setLetters.length == 4) {
        score = i;
        break;
      }
    }

    return score + 4;
  }

  @override
  int solvePart2() {
    int score = 0;

    for (int i = 0; i < input.asString.length; i++) {
      final setLetters = input.asString.substring(i, i + 14).split('').toSet();
      if (setLetters.length == 14) {
        score = i;
        break;
      }
    }

    return score + 14;
  }
}
