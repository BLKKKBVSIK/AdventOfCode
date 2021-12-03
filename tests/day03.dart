import 'package:test/test.dart';
import '../bin/day03.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          partOne(const [
            '00100',
            '11110',
            '10110',
            '10111',
            '10101',
            '01111',
            '00111',
            '11100',
            '10000',
            '11001',
            '00010',
            '01010'
          ]),
          equals(198));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          partTwo(const [
            '00100',
            '11110',
            '10110',
            '10111',
            '10101',
            '01111',
            '00111',
            '11100',
            '10000',
            '11001',
            '00010',
            '01010'
          ]),
          equals(230));
    });
  });
}
