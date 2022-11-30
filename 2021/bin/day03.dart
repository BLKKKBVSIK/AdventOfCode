import 'dart:io';

void main() {
  File myFile = File("bin/data/day03-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  String strEpsilon = "";
  String strGamma = "";

  for (var i = 0; i < input[0].length; i++) {
    int counterOne = 0;
    int counterZero = 0;

    for (var item in input) {
      if (int.parse(item[i]) == 0) {
        counterZero += 1;
      } else if (int.parse(item[i]) == 1) {
        counterOne += 1;
      }
    }
    if (counterZero > counterOne) {
      strGamma += "0";
      strEpsilon += "1";
    } else {
      strGamma += "1";
      strEpsilon += "0";
    }
  }

  return int.parse(strGamma, radix: 2) * int.parse(strEpsilon, radix: 2);
}

int partTwo(List<String> input) {
  List<String> filteredOxygen = input;
  List<String> filteredCo2 = input;

  for (var i = 0; i < input[0].length; i++) {
    if (filteredOxygen.length > 1)
      filteredOxygen =
          filterList(toFilter: filteredOxygen, index: i, isOxygen: true);
    if (filteredCo2.length > 1)
      filteredCo2 = filterList(toFilter: filteredCo2, index: i);
  }

  return int.parse(filteredOxygen.first, radix: 2) *
      int.parse(filteredCo2.first, radix: 2);
}

List<String> filterList({
  required List<String> toFilter,
  required int index,
  bool isOxygen = false,
}) {
  int counterOne = 0;
  int counterZero = 0;
  List<String> filteredList = [];

  for (var item in toFilter) {
    if (int.parse(item[index]) == 0) {
      counterZero += 1;
    } else if (int.parse(item[index]) == 1) {
      counterOne += 1;
    }
  }
  if (counterZero == counterOne) counterOne++;

  if (isOxygen) {
    filteredList = toFilter
        .where((element) =>
            element[index] == (counterZero > counterOne ? "0" : "1"))
        .toList();
  } else {
    filteredList = toFilter
        .where((element) =>
            element[index] == (counterZero < counterOne ? "0" : "1"))
        .toList();
  }

  return filteredList;
}
