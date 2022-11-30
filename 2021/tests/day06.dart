import 'package:test/test.dart';
import '../bin/day06.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(partOne(const ["3,4,3,1,2"]), equals(5934));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(partTwo(const ["3,4,3,1,2"]), equals(26984457539));
    });
  });
}
