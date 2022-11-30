import 'package:test/test.dart';
import '../bin/day09.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          partOne(const [
            "2199943210",
            "3987894921",
            "9856789892",
            "8767896789",
            "9899965678"
          ]),
          equals(15));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          partTwo(const [
            "2199943210",
            "3987894921",
            "9856789892",
            "8767896789",
            "9899965678"
          ]),
          equals(1134));
    });
  });
}
