import 'dart:io';

void main() {
  File myFile = File("bin/data/day04-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  List<int> bingo = getBingoNumber(input);
  List<List<List<int>>> boards = parseInput(input);

  int result = 0;

  for (var bingoNumber in bingo) {
    for (var board in boards) {
      for (var row in board) {
        for (var i = 0; i < row.length; i++) {
          if (row.elementAt(i) == bingoNumber) row[i] = -1;
        }
      }
      result = findAndCalculateWinnerBoard(board, bingoNumber);
      if (result != 0) return result;
    }
  }

  return 1;
}

int partTwo(List<String> input) {
  List<int> bingo = getBingoNumber(input);
  List<List<List<int>>> boards = parseInput(input);
  int result = 0;
  int bordsNotEmpty = 0;

  for (var bingoNumber in bingo) {
    for (var k = 0; k < boards.length; k++) {
      for (var row in boards[k]) {
        for (var i = 0; i < row.length; i++) {
          if (row.elementAt(i) == bingoNumber) {
            row[i] = -1;
          }
        }
      }

      boards.forEach((element) {
        if (element.isNotEmpty) {
          bordsNotEmpty++;
        }
      });

      if (bordsNotEmpty == 1) {
        result = findAndCalculateWinnerBoard(
            boards[boards.indexWhere((element) => element.isNotEmpty)],
            bingoNumber);
        if (result != 0) return result;
      }
      if (bordsNotEmpty > 1) {
        boards = findAndCalculateLooserBoard(boards, boards[k], bingoNumber);
      }
      bordsNotEmpty = 0;
    }
  }

  return 1;
}

List<List<List<int>>> findAndCalculateLooserBoard(
    List<List<List<int>>> boards, List<List<int>> board, int bingoNumber) {
  for (var row in board) {
    if (row.every((element) => element == -1)) {
      boards[boards.indexOf(board)] = [];
      return boards;
    }
  }
  for (var i = 0; i < 5; i++) {
    if (board.every((row) => row.elementAt(i) == -1)) {
      boards[boards.indexOf(board)] = [];
      return boards;
    }
  }
  return boards;
}

List<List<List<int>>> parseInput(List<String> input) {
  List<List<List<int>>> boards = [];
  List<List<int>> board = [];

  for (var i = 1; i < input.length; i++) {
    if (input[i].isEmpty) {
      boards.add(board);
      board = [];
    } else {
      List<String> tmpRow = input[i].split(' ');
      tmpRow.removeWhere((element) => element.isEmpty);
      List<int> row = [];
      tmpRow.forEach((element) {
        row.add(int.parse(element));
      });
      board.add(row);
    }
  }
  boards.add(board);
  boards.removeWhere((element) => element.isEmpty);

  return boards;
}

List<int> getBingoNumber(List<String> input) {
  List<String> tmpList = input[0].split(',');

  List<int> newBingoList = [];
  tmpList.forEach((element) {
    newBingoList.add(int.parse(element));
  });

  return newBingoList;
}

int findAndCalculateWinnerBoard(List<List<int>> board, int bingoNumber) {
  for (var row in board) {
    if (row.every((element) => element == -1)) {
      List<int> unmarkedNumbers = [];
      board.forEach((row) {
        row.forEach((number) {
          if (number >= 0) unmarkedNumbers.add(number);
        });
      });
      return (unmarkedNumbers.reduce((a, b) => a + b) * bingoNumber);
    }
  }
  for (var i = 0; i < 5; i++) {
    if (board.every((row) => row.elementAt(i) == -1)) {
      List<int> unmarkedNumbers = [];
      board.forEach((row) {
        row.forEach((number) {
          if (number >= 0) unmarkedNumbers.add(number);
        });
      });
      return (unmarkedNumbers.reduce((a, b) => a + b) * bingoNumber);
    }
  }
  return 0;
}
