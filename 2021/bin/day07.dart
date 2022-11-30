import 'dart:io';

void main() {
  File myFile = File("bin/data/day07-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  List<int> crabPositions = input.first.split(',').map(int.parse).toList();
  crabPositions.sort();

  int fuelCost = -1;
  for (int i = crabPositions.first; i <= crabPositions.last; i++) {
    final costForPosition =
        crabPositions.map((e) => (e - i).abs()).reduce((a, b) => a + b);
    if (fuelCost == -1 || costForPosition < fuelCost) {
      fuelCost = costForPosition;
    }
  }

  return fuelCost;
}

int partTwo(List<String> input) {
  List<int> crabPositions = input.first.split(',').map(int.parse).toList();
  crabPositions.sort();

  int fuelCost = -1;
  for (int i = crabPositions.first; i <= crabPositions.last; i++) {
    final costForPosition = crabPositions.map((e) {
      int positionDistance = (e - i).abs();
      return positionDistance * (1 + positionDistance) ~/ 2;
    }).reduce((a, b) => a + b);
    if (fuelCost == -1 || costForPosition < fuelCost) {
      fuelCost = costForPosition;
    }
  }

  return fuelCost;
}
