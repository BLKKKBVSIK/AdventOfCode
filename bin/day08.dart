import 'dart:io';

void main() {
  File myFile = File("bin/data/day08-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  int result = 0;
  for (var line in input) {
    List<String> outputValues = line.split("|").last.trim().split(' ');
    for (var oValue in outputValues) {
      if (oValue.length == 2 ||
          oValue.length == 3 ||
          oValue.length == 4 ||
          oValue.length == 7) {
        result++;
      }
    }
  }
  return result;
}

int partTwo(List<String> input) {
  int result = 0;
  for (var line in input) {
    List<String> inputValues = line.split("|").first.trim().split(' ');
    List<String> outputValues = line.split("|").last.trim().split(' ');
    String localOutputValue = '';

    for (var oValues in outputValues) {
      if (oValues.length == 2) {
        localOutputValue += '1';
      } else if (oValues.length == 3) {
        localOutputValue += '7';
      } else if (oValues.length == 4) {
        localOutputValue += '4';
      } else if (oValues.length == 7) {
        localOutputValue += '8';
      } else {
        if (oValues.length == 6) {
          if (hasSameSegmentAs(
                  input: stringWhichHas(lenghtOf: 2, iValues: inputValues),
                  compared: oValues) ==
              2) {
            if (hasSameSegmentAs(
                    input: stringWhichHas(lenghtOf: 4, iValues: inputValues),
                    compared: oValues) ==
                4) {
              localOutputValue += '9';
            } else {
              localOutputValue += '0';
            }
          } else {
            localOutputValue += '6';
          }
        }
        if (oValues.length == 5) {
          if (hasSameSegmentAs(
                  input: stringWhichHas(lenghtOf: 2, iValues: inputValues),
                  compared: oValues) ==
              1) {
            if (hasSameSegmentAs(
                    input: stringWhichHas(lenghtOf: 4, iValues: inputValues),
                    compared: oValues) ==
                3) {
              localOutputValue += '5';
            } else {
              localOutputValue += '2';
            }
          } else {
            localOutputValue += '3';
          }
        }
      }
    }
    result += int.parse(localOutputValue);
  }
  return result;
}

int hasSameSegmentAs({required String input, required String compared}) {
  List<String> lInput = input.split('');
  int segmentMatch = 0;
  for (var item in lInput) {
    if (compared.contains(item)) {
      segmentMatch++;
    }
  }
  return segmentMatch;
}

String stringWhichHas({required int lenghtOf, required List<String> iValues}) {
  return iValues[iValues.indexWhere((element) => element.length == lenghtOf)];
}
