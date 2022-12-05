import '../utils/index.dart';

class Day05 extends GenericDay {
  Day05() : super(5);

  @override
  parseInput() {}

  List<List<String>> filterColumns(String input) {
    List<List<String>> columns = [];
    int lineLength = input.split('\n')[0].length;
    for (int i = 0; i < lineLength; i++) {
      i % 4 == 0 ? columns.add([]) : null;
    }

    for (var line in input.split('\n')) {
      if (line.isEmpty || line == '\n') break;
      final allchars = line.split('');

      for (int i = 0; i < allchars.length; i++) {
        if (i % 4 == 1) {
          columns[i ~/ 4].add(line[i]);
        }
      }
    }

    for (int i = 0; i < columns.length; i++) {
      columns[i].removeWhere((element) => element == ' ');
    }

    return columns;
  }

  @override
  String solvePart1() {
    List<List<String>> columns = filterColumns(input.asString.split('1').first);

    for (var line in input.asString.split('\n\n').last.split('\n')) {
      final quantity = int.parse(line.split(' ').elementAt(1));
      final from = int.parse(line.split(' ').elementAt(3)) - 1;
      final to = int.parse(line.split(' ').elementAt(5)) - 1;

      final tmpCargo = columns[from].take(quantity).toList().reversed;

      columns[from].removeRange(0, quantity);
      columns[to].insertAll(0, tmpCargo);
    }

    return columns.map((e) => e.first).join('');
  }

  @override
  String solvePart2() {
    List<List<String>> columns = filterColumns(input.asString.split('1').first);

    for (var line in input.asString.split('\n\n').last.split('\n')) {
      final quantity = int.parse(line.split(' ').elementAt(1));
      final from = int.parse(line.split(' ').elementAt(3)) - 1;
      final to = int.parse(line.split(' ').elementAt(5)) - 1;

      columns[to].insertAll(0, columns[from].take(quantity));
      columns[from].removeRange(0, quantity);
    }

    return columns.map((e) => e.first).join('');
  }
}
