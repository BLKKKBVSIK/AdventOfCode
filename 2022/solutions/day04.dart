import '../utils/index.dart';

class Day04 extends GenericDay {
  Day04() : super(4);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int score = 0;

    for (var line in input.getPerLine()) {
      final firstPair = line.split(',').first;
      final secondPair = line.split(',').last;

      final firstPairDigits = firstPair.split('-');
      final secondPairDigits = secondPair.split('-');

      final firstPairMin = int.parse(firstPairDigits.first);
      final firstPairMax = int.parse(firstPairDigits.last);

      final secondPairMin = int.parse(secondPairDigits.first);
      final secondPairMax = int.parse(secondPairDigits.last);

      if (secondPairMin >= firstPairMin && secondPairMax <= firstPairMax ||
          secondPairMin <= firstPairMin && secondPairMax >= firstPairMax) {
        score++;
      }
    }

    return score;
  }

  @override
  int solvePart2() {
    int score = 0;

    for (var line in input.getPerLine()) {
      final firstPair = line.split(',').first;
      final secondPair = line.split(',').last;

      final firstPairDigits = firstPair.split('-');
      final secondPairDigits = secondPair.split('-');

      final firstPairMin = int.parse(firstPairDigits.first);
      final firstPairMax = int.parse(firstPairDigits.last);

      final secondPairMin = int.parse(secondPairDigits.first);
      final secondPairMax = int.parse(secondPairDigits.last);

      final firstList = [for (var i = firstPairMin; i <= firstPairMax; i++) i];
      final secondList = [
        for (var i = secondPairMin; i <= secondPairMax; i++) i
      ];

      final intersection = firstList.toSet().intersection(secondList.toSet());

      if (intersection.isNotEmpty) {
        score++;
      }
    }

    return score;
  }
}
