import '../utils/index.dart';

class Day08 extends GenericDay {
  Day08() : super(8);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    List<List<int>> forest = [];

    for (var line in input.getPerLine()) {
      forest.add(line.split('').map((e) => int.parse(e)).toList());
    }

    int count = 0;

    for (var y = 0; y < forest.length; y++) {
      for (var x = 0; x < forest[y].length; x++) {
        int tree = forest[y][x];

        if (y == 0 ||
            y == forest.length - 1 ||
            x == 0 ||
            x == forest[y].length - 1) {
          count++;
        } else {
          List<int> tops = getVerticalValue(forest, y, x).reversed.toList();
          List<int> bottoms = getVerticalValue(forest, y, x, top: false);
          List<int> lefts = getHorizonValue(forest, y, x).reversed.toList();
          List<int> right = getHorizonValue(forest, y, x, left: false);

          if (tops.every((element) => element < tree) ||
              bottoms.every((element) => element < tree) ||
              lefts.every((element) => element < tree) ||
              right.every((element) => element < tree)) {
            count++;
          }
        }
      }
    }

    return count;
  }

  @override
  int solvePart2() {
    List<List<int>> forest = [];

    for (var line in input.getPerLine()) {
      forest.add(line.split('').map((e) => int.parse(e)).toList());
    }

    int score = 0;

    for (var y = 0; y < forest.length; y++) {
      for (var x = 0; x < forest[y].length; x++) {
        int tree = forest[y][x];

        if (y != 0 ||
            y != forest.length - 1 ||
            x != 0 ||
            x != forest[y].length - 1) {
          List<int> tops = getVerticalValue(forest, y, x).reversed.toList();
          List<int> bottoms = getVerticalValue(forest, y, x, top: false);
          List<int> lefts = getHorizonValue(forest, y, x).reversed.toList();
          List<int> right = getHorizonValue(forest, y, x, left: false);

          int tmpScore = getScenicScore(forest[y][x], tops) *
              getScenicScore(forest[y][x], bottoms) *
              getScenicScore(forest[y][x], lefts) *
              getScenicScore(forest[y][x], right);
          if (tmpScore > score) {
            score = tmpScore;
          }
        }
      }
    }

    return score;
  }

  List<int> getVerticalValue(List<List<int>> forest, int y, int x,
      {bool top = true}) {
    List<int> verticalValues = [];

    if (top)
      for (var i = 0; i < y; i++) verticalValues.add(forest[i][x]);
    else
      for (var i = y + 1; i < forest.length; i++)
        verticalValues.add(forest[i][x]);

    return verticalValues;
  }

  List<int> getHorizonValue(List<List<int>> forest, int y, int x,
      {bool left = true}) {
    List<int> horizontalValues = [];

    if (left)
      for (var i = 0; i < x; i++) horizontalValues.add(forest[y][i]);
    else
      for (var i = x + 1; i < forest[y].length; i++)
        horizontalValues.add(forest[y][i]);

    return horizontalValues;
  }

  int getScenicScore(int forest, List<int> direction) {
    int directionScore = 0;
    bool lastTree = true;

    direction.forEach((element) {
      if (lastTree == true) {
        if (element < forest)
          directionScore++;
        else {
          directionScore++;
          lastTree = false;
        }
      }
    });
    return directionScore;
  }
}
