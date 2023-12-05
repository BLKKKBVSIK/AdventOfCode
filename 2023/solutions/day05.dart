import '../utils/index.dart';

class Day05 extends GenericDay {
  Day05() : super(5);

  @override
  parseInput() {}

  List<int> processInstructions(List<int> input, List<List<int>> instructions) {
    List<int> newInput = [];

    for (var num in input) {
      final newInputSize = newInput.length;
      for (var instruction in instructions) {
        if (num >= instruction.elementAt(1) && num <= instruction.elementAt(1) + instruction.last) {
          newInput.add(instruction.first + (num - instruction.elementAt(1)).abs());
          break;
        }
      }
      if (newInput.length == newInputSize) newInput.add(num);
    }

    return newInput;
  }

  @override
  int solvePart1() {
    final allInstructions = input.asString.split('seeds:').last.split('\n\n');

    List<int> newInput =
        allInstructions.first.split(' ').where((e) => e.isNotEmpty).map(int.parse).toList();

    for (var instruction in allInstructions) {
      List<List<int>> instructionsList =
          instruction.split('\n').whereIndexed((index, element) => index != 0).map((e) {
        return e.split(' ').where((e) => e.isNotEmpty).map(int.parse).toList();
      }).toList();

      newInput = processInstructions(newInput, instructionsList);
    }
    newInput.sort();
    return newInput.first;
  }

  @override
  int solvePart2() {
    // Doesnt work yet
    final allInstructions = input.asString.split('seeds:').last.split('\n\n');

    List<int> newInput =
        allInstructions.first.split(' ').where((e) => e.isNotEmpty).map(int.parse).toList();

    final firstPair = List<int>.generate(newInput.elementAt(1), (index) => newInput.first + index);
    final secondPair = List<int>.generate(newInput.last, (index) => newInput.elementAt(2) + index);

    newInput = firstPair + secondPair;

    for (var instruction in allInstructions) {
      List<List<int>> instructionsList =
          instruction.split('\n').whereIndexed((index, element) => index != 0).map((e) {
        return e.split(' ').where((e) => e.isNotEmpty).map(int.parse).toList();
      }).toList();

      newInput = processInstructions(newInput, instructionsList);
    }
    newInput.sort();
    return newInput.first;
  }
}
