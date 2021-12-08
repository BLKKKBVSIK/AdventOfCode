import 'package:test/test.dart';
import '../bin/day07.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(partOne(const ["16,1,2,0,4,2,7,1,2,14"]), equals(37));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(partTwo(const ["16,1,2,0,4,2,7,1,2,14"]), equals(168));
    });
  });
}
