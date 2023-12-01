import 'dart:async';
import 'dart:io';

/// Small Program to be used to generate files and boilerplate for a given day.\
/// Call with `dart run day_generator.dart <day>`
void main(List<String?> args) async {
  String year = '2023';
  String session =
      '53616c7465645f5f864e5729a004421cf4b52792d27c9d24ede54c18e4020f40ff6b2af30ecc20a0dacb7b0e2630fd1da9d876d0d64912c238c55ac824a4f4d1';

  if (args.length > 1) {
    print('Please call with: <dayNumber>');
    return;
  }

  String? dayNumber;

  // input through terminal
  if (args.length == 0) {
    print('Please enter a day for which to generate files');
    final input = stdin.readLineSync();
    if (input == null) {
      print('No input given, exiting');
      return;
    }
    // pad day number to have 2 digits
    dayNumber = int.parse(input).toString().padLeft(2, '0');
    // input from CLI call
  } else {
    dayNumber = int.parse(args[0]!).toString().padLeft(2, '0');
  }

  // inform user
  print('Creating day: $dayNumber');

  // Create lib file
  final dayFileName = 'day$dayNumber.dart';
  unawaited(
    File('solutions/$dayFileName').writeAsString(
      '''
import '../utils/index.dart';

class Day$dayNumber extends GenericDay {
  Day$dayNumber() : super(${int.parse(dayNumber)});

  @override
  parseInput() {
    
  }

  @override
  int solvePart1() {
    
    return 0;
  }

  @override
  int solvePart2() {

    return 0;
  }
}

''',
    ),
  );

  // export new day in index file
  File('solutions/index.dart').writeAsString(
    'export \'day$dayNumber.dart\';\n',
    mode: FileMode.append,
  );

  // Create input file
  print('Loading input from adventofcode.com...');
  try {
    final request = await HttpClient()
        .getUrl(Uri.parse('https://adventofcode.com/$year/day/${int.parse(dayNumber)}/input'));
    request.cookies.add(Cookie("session", session));
    final response = await request.close();
    final dataPath = 'input/aoc$dayNumber.txt';
    // unawaited(File(dataPath).create());
    response.pipe(File(dataPath).openWrite());
  } on Error catch (e) {
    print('Error loading file: $e');
  }

  print('All set, Good luck!');
}
