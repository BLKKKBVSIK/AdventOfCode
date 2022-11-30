import 'dart:io';

void main() {
  File myFile = File("bin/data/day06-input.txt");
  List<String> input = myFile.readAsLinesSync();

  print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input, {int days = 80}) {
  List<int> fishs = List.generate(10, (index) => 0);
  input[0].split(',').forEach((element) {
    fishs[int.parse(element)] = fishs[int.parse(element)] += 1;
  });

  for (var i = 0; i < days; i++) {
    for (var k = 0; k < fishs.length; k++) {
      if (k == 0) {
        if (fishs[k] != 0) {
          fishs[7] += fishs[k];
          fishs[9] += fishs[k];
          fishs[0] = 0;
        }
      }
      if (k > 0) {
        fishs[k - 1] += fishs[k];
        fishs[k] = 0;
      }
    }
  }

  int result = 0;

  fishs.forEach((element) {
    result += element;
  });

  return result;
}

int partTwo(List<String> input, {int days = 256}) {
  return partOne(input, days: days);
}
