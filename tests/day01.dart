import 'dart:io';
import 'package:test/test.dart';
import '../bin/day01.dart';

final input = File('test/data/day01.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(partOne(const [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]),
          equals(7));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(partTwo(const [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]),
          equals(5));
    });
  });
}
