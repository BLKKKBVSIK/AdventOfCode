import '../utils/index.dart';

class Day04 extends GenericDay {
  Day04() : super(4);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int result = 0;

    for (var elem in input.getPerLine()) {
      List<String> winningNumbers = [];
      List<String> numberSelected = [];
      int res = 0;

      winningNumbers =
          elem.split(':').last.split('|').first.split(' ').where((e) => e.isNotEmpty).toList();
      numberSelected =
          elem.split(':').last.split('|').last.split(' ').where((e) => e.isNotEmpty).toList();

      for (var num in numberSelected) {
        if (winningNumbers.contains(num)) {
          res += res > 0 ? res : 1;
        }
      }

      result += res;
    }

    return result;
  }

  @override
  int solvePart2() {
    Map<int, int> cardsToScratch = {};

    for (var i = 1; i <= input.getPerLine().length; i++) {
      final elem = input.getPerLine()[i - 1];

      cardsToScratch[i] = (cardsToScratch[i] ?? 0) + 1;

      List<String> winningNumbers = [];
      List<String> numberSelected = [];
      int nbOfMatches = 0;

      winningNumbers =
          elem.split(':').last.split('|').first.split(' ').where((e) => e.isNotEmpty).toList();
      numberSelected =
          elem.split(':').last.split('|').last.split(' ').where((e) => e.isNotEmpty).toList();

      for (var x = 0; x < numberSelected.length; x++) {
        if (winningNumbers.contains(numberSelected[x])) {
          nbOfMatches++;
        }
      }

      for (var x = 1; x <= nbOfMatches; x++) {
        cardsToScratch[i + x] = (cardsToScratch[i + x] ?? 0) + 1;
        if (cardsToScratch[i] != 1 && cardsToScratch[i] != null) {
          for (var y = 1; y < cardsToScratch[i]!; y++) {
            cardsToScratch[i + x] = (cardsToScratch[i + x] ?? 0) + 1;
          }
        }
      }
    }

    return cardsToScratch.values.toList().reduce((a, b) => a + b);
  }
}
