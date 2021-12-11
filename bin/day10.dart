import 'dart:io';

void main() {
  File myFile = File("bin/data/day10-input.txt");
  List<String> input = myFile.readAsLinesSync();

  //print("Result1: " + partOne(input).toString());
  print("Result2: " + partTwo(input).toString());
}

int partOne(List<String> input) {
  List<String> corruptedChars = [];
  for (var line in input) {
    List<String> openChunk = [];
    bool flagLine = false;
    for (var i = 0; i < line.length; i++) {
      if (line[i] == "{" ||
          line[i] == "(" ||
          line[i] == "[" ||
          line[i] == "<") {
        openChunk.add(line[i]);
      }
      if (line[i] == "}" ||
          line[i] == ")" ||
          line[i] == "]" ||
          line[i] == ">") {
        if (line[i] != getOpposite(openChunk.last)) {
          flagLine = true;
        } else {
          openChunk.removeLast();
        }
      }
      if (flagLine) {
        corruptedChars.add(line[i]);
        i = line.length;
      }
    }
  }

  int result = 0;

  for (var char in corruptedChars) {
    switch (char) {
      case "}":
        result += 1197;
        break;
      case ")":
        result += 3;
        break;
      case "]":
        result += 57;
        break;
      case ">":
        result += 25137;
        break;
      default:
    }
  }

  return result;
}

String getOpposite(String char) {
  switch (char) {
    case '{':
      return "}";
    case '(':
      return ")";
    case '[':
      return "]";
    case '<':
      return ">";
    default:
      return "";
  }
}

int partTwo(List<String> input) {
  List<int> results = [];
  for (var line in input) {
    int totalLineScore = 0;
    List<String> openChunk = [];
    bool flagLine = false;
    for (var i = 0; i < line.length; i++) {
      if (line[i] == "{" ||
          line[i] == "(" ||
          line[i] == "[" ||
          line[i] == "<") {
        openChunk.add(line[i]);
      }
      if (line[i] == "}" ||
          line[i] == ")" ||
          line[i] == "]" ||
          line[i] == ">") {
        if (line[i] != getOpposite(openChunk.last)) {
          flagLine = true;
        } else {
          openChunk.removeLast();
        }
      }
    }

    if (flagLine == false) {
      openChunk.reversed.toList().forEach((element) {
        totalLineScore = (totalLineScore * 5) + getValueFromSymbol(element);
      });

      results.add(totalLineScore);
    }
  }

  results.sort();

  return results[(results.length / 2).floor()];
}

int getValueFromSymbol(String element) {
  switch (element) {
    case '{':
      return 3;
    case '(':
      return 1;
    case '[':
      return 2;
    case '<':
      return 4;
    default:
      return 0;
  }
}
