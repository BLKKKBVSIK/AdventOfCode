import '../utils/index.dart';

class Day07 extends GenericDay {
  Day07() : super(7);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    final root = Directory();
    late Directory currentDirectory;

    for (final line in input.getPerLine()) {
      final command = line.split(' ')[0];

      if (command == '\$') {
        final subCommand = line.split(' ')[1];
        if (subCommand == 'cd') {
          final name = line.split(' ')[2];
          if (name == '/') {
            currentDirectory = root;
          } else if (name == '..') {
            currentDirectory = currentDirectory.parent!;
          } else {
            currentDirectory = currentDirectory.directories
                .singleWhere((directory) => directory.name == name);
          }
        }
      } else if (command == 'dir') {
        final name = line.split(' ')[1];
        currentDirectory.directories.add(
          Directory(parent: currentDirectory, name: name),
        );
      } else {
        final size = int.parse(line.split(' ')[0]);
        final name = line.split(' ')[1];
        currentDirectory.files.add(
          File(name: name, size: size),
        );
      }
    }

    int total = spreadTree(root)
        .map((directory) => directory.size)
        .where((size) => size <= 100000)
        .sum;

    return total;
  }

  @override
  int solvePart2() {
    final root = Directory();
    late Directory currentDirectory;

    for (final line in input.getPerLine()) {
      final command = line.split(' ')[0];

      if (command == '\$') {
        final subCommand = line.split(' ')[1];
        if (subCommand == 'cd') {
          final name = line.split(' ')[2];
          if (name == '/') {
            currentDirectory = root;
          } else if (name == '..') {
            currentDirectory = currentDirectory.parent!;
          } else {
            currentDirectory = currentDirectory.directories
                .singleWhere((directory) => directory.name == name);
          }
        }
      } else if (command == 'dir') {
        final name = line.split(' ')[1];
        currentDirectory.directories.add(
          Directory(parent: currentDirectory, name: name),
        );
      } else {
        final size = int.parse(line.split(' ')[0]);
        final name = line.split(' ')[1];
        currentDirectory.files.add(
          File(name: name, size: size),
        );
      }
    }

    final result = spreadTree(root).map((directory) => directory.size).toList();
    final resultSorted = result..sort();

    return spreadTree(root)
        .map((directory) => directory.size)
        .sorted((a, b) => a.compareTo(b))
        .firstWhere((size) =>
            70000000 -
                spreadTree(root).map((directory) => directory.size).first +
                size >=
            30000000);
  }
}

List<Directory> spreadTree(Directory currentDirectory) {
  List<Directory> tree = [];
  tree.add(currentDirectory);

  for (final directory in currentDirectory.directories) {
    tree.addAll(spreadTree(directory));
  }

  return tree;
}

class Directory {
  Directory({this.parent, this.name})
      : directories = <Directory>[],
        files = <File>[];

  final Directory? parent;
  final String? name;
  final List<Directory> directories;
  final List<File> files;

  int get size => [
        ...directories.map((directory) => directory.size),
        ...files.map((file) => file.size),
      ].sum;
}

class File {
  const File({required this.name, required this.size});

  final String name;
  final int size;
}
