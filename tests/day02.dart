import 'package:test/test.dart';
import '../bin/day02.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          partOne(const [
            "forward 5",
            "down 5",
            "forward 8",
            "up 3",
            "down 8",
            "forward 2"
          ]),
          equals(150));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          partTwo(const [
            "forward 5",
            "down 5",
            "forward 8",
            "up 3",
            "down 8",
            "forward 2"
          ]),
          equals(900));
    });
  });
}
