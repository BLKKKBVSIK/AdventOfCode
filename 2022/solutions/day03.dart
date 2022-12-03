import '../utils/index.dart';

class Day03 extends GenericDay {
  Day03() : super(3);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int score = 0;
    for (var line in input.getPerLine()) {
      final firstPart = line.substring(0, line.length ~/ 2);
      final secondPart = line.substring(line.length ~/ 2);

      for (var char in firstPart.split('')) {
        if (secondPart.contains(char)) {
          score += getScoreOnString(char);
          break;
        }
      }
    }
    return score;
  }

  @override
  int solvePart2() {
    String allLetters = '';

    for (var group in partition(input.getPerLine(), 3).toList()) {
      for (var line in group) {
        for (var char in line.split('')) {
          if (group.elementAt(0).contains(char) &&
              group.elementAt(1).contains(char) &&
              group.elementAt(2).contains(char)) {
            allLetters += char;
            break;
          }
        }
        break;
      }
    }

    return getScoreOnString(allLetters);
  }

  int getScoreOnString(String scoreString) {
    int score = 0;

    for (var char in scoreString.split('')) {
      // if char is between a and z
      if (char.codeUnitAt(0) >= 97 && char.codeUnitAt(0) <= 122) {
        char.codeUnits.forEach((element) {
          score += element - 96;
        });
        // if char is between A and Z
      } else if (char.codeUnitAt(0) >= 65 && char.codeUnitAt(0) <= 90) {
        char.codeUnits.forEach((element) {
          score += element - 38;
        });
      }
    }

    return score;
  }
}
