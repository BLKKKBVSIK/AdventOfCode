import 'dart:io';

void main() {
  File myFile = File("bin/data/day02-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  int depthPosition = 0;
  int horizontalPosition = 0;

  for (var item in input) {
    List<String> strShards = item.split(" ");
    switch (strShards[0]) {
      case 'forward':
        horizontalPosition += int.parse(strShards[1]);
        break;
      case 'up':
        depthPosition -= int.parse(strShards[1]);
        break;
      case 'down':
        depthPosition += int.parse(strShards[1]);
        break;
      default:
    }
  }
  return depthPosition * horizontalPosition;
}

int partTwo(List<String> input) {
  int depthPosition = 0;
  int horizontalPosition = 0;
  int aim = 0;

  for (var item in input) {
    List<String> strShards = item.split(" ");
    switch (strShards[0]) {
      case 'forward':
        horizontalPosition += int.parse(strShards[1]);
        depthPosition += int.parse(strShards[1]) * aim;
        break;
      case 'up':
        aim -= int.parse(strShards[1]);
        break;
      case 'down':
        aim += int.parse(strShards[1]);
        break;
      default:
    }
  }
  return depthPosition * horizontalPosition;
}
