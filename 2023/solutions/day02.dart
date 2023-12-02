import '../utils/index.dart';

enum CubeColorLimit {
  red(12),
  green(13),
  blue(14);

  const CubeColorLimit(this.value);
  final int value;
}

class Day02 extends GenericDay {
  Day02() : super(2);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int result = 0;
    for (var element in input.getPerLine()) {
      bool isPossible = true;

      final intGameNumber = element.split(':').first.replaceAll(new RegExp(r'[^0-9]'), '');
      final gameSets = element.split(':').last.split(';').toSet();
      for (var set in gameSets) {
        final cubes = set.split(',').toSet();

        for (var cube in cubes) {
          final color = cube.replaceAll(new RegExp(r'[^a-zA-Z]'), '');
          final amount = int.parse(cube.replaceAll(new RegExp(r'[^0-9]'), ''));

          if (amount >
              CubeColorLimit.values
                  .firstWhere((e) => e.toString().split('.').last == color)
                  .value) {
            isPossible = false;
          }
        }
      }
      result += isPossible ? int.parse(intGameNumber) : 0;
    }

    return result;
  }

  @override
  int solvePart2() {
    int result = 0;
    for (var element in input.getPerLine()) {
      int redBiggest = 0;
      int greenBiggest = 0;
      int blueBiggest = 0;

      final gameSets = element.split(':').last.split(';').toSet();
      for (var set in gameSets) {
        final cubes = set.split(',').toSet();

        for (var cube in cubes) {
          final color = cube.replaceAll(new RegExp(r'[^a-zA-Z]'), '');
          final amount = int.parse(cube.replaceAll(new RegExp(r'[^0-9]'), ''));

          if (color == 'red') {
            if (amount > redBiggest) {
              redBiggest = amount;
            }
          } else if (color == 'green') {
            if (amount > greenBiggest) {
              greenBiggest = amount;
            }
          } else if (color == 'blue') {
            if (amount > blueBiggest) {
              blueBiggest = amount;
            }
          }
        }
      }
      result += redBiggest * greenBiggest * blueBiggest;
    }
    return result;
  }
}
