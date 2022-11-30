import 'dart:io';

void main() {
  File myFile = File("bin/data/day01-input.txt");
  List<int> input = myFile.readAsLinesSync().map((e) => int.parse(e)).toList();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<int> input) {
  int actualNumber = input.first;
  int incrementTime = 0;

  for (var item in input) {
    if (item > actualNumber) {
      incrementTime++;
    }
    actualNumber = item;
  }
  return incrementTime;
}

int partTwo(List<int> input) {
  List<int> newInput = [];

  for (var i = 0; i < input.length; i++) {
    int end = (i + 3 < input.length) ? i + 3 : input.length;
    newInput.add(input.sublist(i, end).reduce((a, b) => a + b));
  }

  return partOne(newInput);
}
