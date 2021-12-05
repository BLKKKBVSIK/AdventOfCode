import 'dart:io';

import 'dart:math';

void main() {
  File myFile = File("bin/data/day05-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  List<List<int>> grid = createGrid();

  for (var line in input) {
    List<int> positionOne = [];
    List<int> positionTwo = [];

    List<String> positions = line.split("->");
    positions.first.split(',').forEach((element) {
      positionOne.add(int.parse(element));
    });
    positions.last.split(',').forEach((element) {
      positionTwo.add(int.parse(element));
    });

    if (positionOne.first == positionTwo.first) {
      int maxValue = [positionOne.last, positionTwo.last].reduce(max);
      int minValue = [positionOne.last, positionTwo.last].reduce(min);
      while (minValue <= maxValue) {
        grid[minValue][positionOne.first] += 1;
        minValue++;
      }
    }
    if (positionOne.last == positionTwo.last) {
      int maxValue = [positionTwo.first, positionOne.first].reduce(max);
      int minValue = [positionTwo.first, positionOne.first].reduce(min);
      while (minValue <= maxValue) {
        grid[positionOne.last][minValue] += 1;
        minValue++;
      }
    }
  }

  int result = 0;

  for (var item in grid) {
    item.forEach((element) {
      if (element >= 2) {
        result++;
      }
    });
  }

  return result;
}

List<List<int>> createGrid() {
  List<List<int>> grid = [];
  for (var i = 0; i < 1000; i++) {
    grid.add(List.generate(1000, (index) => 0));
  }
  return grid;
}

int partTwo(List<String> input) {
  List<List<int>> grid = createGrid();

  for (var line in input) {
    List<int> positionOne = [];
    List<int> positionTwo = [];

    List<String> positions = line.split("->");
    positions.first.split(',').forEach((element) {
      positionOne.add(int.parse(element));
    });
    positions.last.split(',').forEach((element) {
      positionTwo.add(int.parse(element));
    });

    if (positionOne.first == positionTwo.first) {
      int maxValue = [positionOne.last, positionTwo.last].reduce(max);
      int minValue = [positionOne.last, positionTwo.last].reduce(min);
      while (minValue <= maxValue) {
        grid[minValue][positionOne.first] += 1;
        minValue++;
      }
    } else if (positionOne.last == positionTwo.last) {
      int maxValue = [positionTwo.first, positionOne.first].reduce(max);
      int minValue = [positionTwo.first, positionOne.first].reduce(min);
      while (minValue <= maxValue) {
        grid[positionOne.last][minValue] += 1;
        minValue++;
      }
    } else {
      bool goUp = true;
      bool goRight = true;
      if (positionOne.last < positionTwo.last) goUp = false;
      if (positionOne.first > positionTwo.first) goRight = false;
      while (positionOne.first != positionTwo.first &&
          positionOne.last != positionTwo.last) {
        grid[positionOne.last][positionOne.first] += 1;
        positionOne.last = goUp ? positionOne.last -= 1 : positionOne.last += 1;
        positionOne.first =
            goRight ? positionOne.first += 1 : positionOne.first -= 1;

        if (positionOne.first == positionTwo.first &&
            positionOne.last == positionTwo.last) {
          grid[positionOne.last][positionOne.first] += 1;
        }
      }
    }
  }

  int result = 0;

  for (var item in grid) {
    item.forEach((element) {
      if (element >= 2) {
        result++;
      }
    });
  }

  return result;
}
