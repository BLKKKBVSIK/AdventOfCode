import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int caloryPerItem = 0;
    int caloryPerElf = 0;

    for (var element in input.getPerLine()) {
      if (element.isEmpty) {
        if (caloryPerItem > caloryPerElf) {
          caloryPerElf = caloryPerItem;
        }
        caloryPerItem = 0;
      } else {
        caloryPerItem += int.parse(element);
      }
    }

    return caloryPerElf;
  }

  @override
  int solvePart2() {
    int caloryPerItem = 0;
    List<int> caloryPerElf = [];

    for (var element in input.getPerLine()) {
      if (element.isEmpty) {
        caloryPerElf.add(caloryPerItem);
        caloryPerItem = 0;
      } else {
        caloryPerItem += int.parse(element);
      }
    }
    caloryPerElf.sort();
    return caloryPerElf.reversed
        .take(3)
        .reduce((value, element) => value + element);
  }
}
