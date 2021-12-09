import 'dart:io';
import 'dart:math';

void main() {
  File myFile = File("bin/data/day09-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  int result = 0;
  for (var y = 0; y < input.length; y++) {
    for (var x = 0; x < input[y].length; x++) {
      List<int> adjacentPos = [];
      int currentPos = int.parse(input[y][x]);
      if (y > 0) adjacentPos.add(int.parse(input[y - 1][x]));
      if (y + 1 < input.length) adjacentPos.add(int.parse(input[y + 1][x]));
      if (x > 0) adjacentPos.add(int.parse(input[y][x - 1]));
      if (x + 1 < input[y].length) adjacentPos.add(int.parse(input[y][x + 1]));

      if (currentPos < adjacentPos.reduce(min)) {
        result += currentPos + 1;
      }
    }
  }
  return result;
}

int partTwo(List<String> input) {
  List<List<int>> lowPointsPos = getLowPointPositions(input);
  List<int> result = [];
  List<List<List<int>>> allBassins = [];

  for (var pos in lowPointsPos) {
    int lowPointDepth = int.parse(input[pos.first][pos.last]);
    List<List<int>> adjacentBassinPos = [pos];
    List<List<int>> posToCheck = [];
    int sizeBassin = 1;
    int newSizeBassin = sizeBassin;

    List<List<int>> bassinPos = [pos];

    while (adjacentBassinPos != []) {
      for (var item in adjacentBassinPos) {
        if (item.first > 0) posToCheck.add([item.first - 1, item.last]);
        if (item.first + 1 < input.length)
          posToCheck.add([item.first + 1, item.last]);
        if (item.last > 0) posToCheck.add([item.first, item.last - 1]);
        if (item.last + 1 < input[0].length)
          posToCheck.add([item.first, item.last + 1]);
      }

      adjacentBassinPos = [];

      for (var posCheck in posToCheck) {
        if (int.parse(input[posCheck.first][posCheck.last]) ==
            lowPointDepth + 1) {
          if (lowPointDepth + 1 != 9) {
            if (!adjacentBassinPos.any((elem) => listEquals(posCheck, elem))) {
              bassinPos.add(posCheck);
              adjacentBassinPos.add(posCheck);
              newSizeBassin++;
            }
          }
        }
      }

      if (newSizeBassin > sizeBassin) {
        sizeBassin = newSizeBassin;
        lowPointDepth += 1;
      } else {
        break;
      }

      posToCheck = [];
    }

    allBassins.add(bassinPos);

    result.add(sizeBassin);
  }

  result.sort();

  //printMap(input, allBassins);

  return result
      .getRange(result.length - 3, result.length)
      .toList()
      .reduce((a, b) => a * b);
}

void printMap(List<String> input, List<List<List<int>>> allBassins) {
  for (var i = 0; i < input.length; i++) {
    for (var j = 0; j < input[i].length; j++) {
      bool find = false;
      for (var bass in allBassins) {
        for (var item in bass) {
          if (input[i][j] == input[item.first][item.last]) {
            find = true;
          }
        }
      }
      if (find) {
        stdout.write("\x1B[31m${input[i][j]}\x1B[0m");
      } else {
        stdout.write(input[i][j]);
      }
    }
    stdout.write("\n");
  }
}

List<List<int>> getLowPointPositions(List<String> input) {
  List<List<int>> lowPoints = [];
  for (var y = 0; y < input.length; y++) {
    for (var x = 0; x < input[y].length; x++) {
      List<int> adjacentPos = [];
      int currentPos = int.parse(input[y][x]);
      if (y > 0) adjacentPos.add(int.parse(input[y - 1][x]));
      if (y + 1 < input.length) adjacentPos.add(int.parse(input[y + 1][x]));
      if (x > 0) adjacentPos.add(int.parse(input[y][x - 1]));
      if (x + 1 < input[y].length) adjacentPos.add(int.parse(input[y][x + 1]));

      if (currentPos < adjacentPos.reduce(min)) lowPoints.add([y, x]);
    }
  }
  return lowPoints;
}

bool listEquals<T>(List<T> list1, List<T> list2) {
  if (list1.length != list2.length) return false;
  for (var i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) return false;
  }
  return true;
}
