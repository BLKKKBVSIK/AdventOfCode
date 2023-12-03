import '../utils/index.dart';

class Day03 extends GenericDay {
  Day03() : super(3);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int result = 0;

    List<List<String>> inputSplitted = [];
    for (var element in input.getPerLine()) {
      inputSplitted.add(element.split(''));
    }

    final field = Field(inputSplitted);

    List<String> fnumbersList = [];
    List<String> numberList = [];
    bool isEnginePart = false;

    field.forEach((x, y) {
      if (field.getValueAt(x, y).contains(new RegExp(r'[0-9]'))) {
        numberList.add(field.getValueAt(x, y));
        field.neighbours(x, y).forEach((element) {
          if (field.getValueAtPosition(element) != '.' &&
              !field.getValueAtPosition(element).contains(new RegExp(r'[0-9]'))) {
            isEnginePart = true;
          }
        });
      } else {
        if (numberList.isNotEmpty && isEnginePart) fnumbersList.add(numberList.join(''));
        isEnginePart = false;
        numberList.clear();
      }
    });

    for (var element in fnumbersList) {
      result += int.parse(element);
    }

    return result;
  }

  @override
  int solvePart2() {
    int result = 0;

    List<List<String>> inputSplitted = [];
    for (var element in input.getPerLine()) {
      inputSplitted.add(element.split(''));
    }

    final field = Field(inputSplitted);

    List<List<String>> fnumbersList = [];
    List<String> numberList = [];
    bool isEnginePart = false;
    String symbolEnginePart = '';
    Position positionEnginePart = Position(0, 0);

    field.forEach((x, y) {
      if (field.getValueAt(x, y).contains(new RegExp(r'[0-9]'))) {
        numberList.add(field.getValueAt(x, y));
        field.neighbours(x, y).forEach((element) {
          if (field.getValueAtPosition(element) != '.' &&
              !field.getValueAtPosition(element).contains(new RegExp(r'[0-9]'))) {
            isEnginePart = true;
            symbolEnginePart = field.getValueAtPosition(element);
            positionEnginePart = element;
          }
        });
      } else {
        if (numberList.isNotEmpty && isEnginePart) {
          //['+', '5,6', '417']
          fnumbersList.add([symbolEnginePart, positionEnginePart.toString(), numberList.join('')]);
        }

        isEnginePart = false;
        numberList.clear();
      }
    });

    List<List<String>> fnumbersList2 = [];
    List<String> positionList = [];

    for (var element in fnumbersList) {
      if (element.first == '*') {
        if (fnumbersList.where((e) => e.first == '*' && e[1] == element[1]).length == 2) {
          final tmpSet = fnumbersList.where((e) => e.first == '*' && e[1] == element[1]);

          if (!positionList.contains(element[1])) {
            fnumbersList2.add([element[0], element[1], tmpSet.first.last, tmpSet.last.last]);
            positionList.add(element[1]);
          }
        }
      }
    }

    for (var element in fnumbersList2) {
      result += int.parse(element[2]) * int.parse(element[3]);
    }

    return result;
  }
}
