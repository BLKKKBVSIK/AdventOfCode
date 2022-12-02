import '../utils/index.dart';

class Day02 extends GenericDay {
  Day02() : super(2);

  @override
  parseInput() {}

  @override
  int solvePart1() {
    int globalScore = 0;

    for (var line in input.getPerLine()) {
      final opponentMove =
          RockPaperScissors.fromPlayerMove(line.split(' ').first.trim());
      final playerMove =
          RockPaperScissors.fromPlayerMove(line.split(' ').last.trim());

      globalScore += playerMove.compare(opponentMove);
    }
    return globalScore;
  }

  @override
  int solvePart2() {
    int globalScore = 0;

    for (var line in input.getPerLine()) {
      final opponentMove =
          RockPaperScissors.fromPlayerMove(line.split(' ').first.trim());
      final winCondition = line.split(' ').last.trim();

      globalScore += opponentMove.compareToWinCondition(winCondition);
    }

    return globalScore;
  }
}

enum MoveSet {
  rock(1),
  paper(2),
  scissors(3);

  const MoveSet(this.value);
  final int value;
}

class RockPaperScissors {
  late MoveSet move;
  // Constructor from a string
  RockPaperScissors.fromPlayerMove(String input) {
    if (input == 'A' || input == 'X') {
      move = MoveSet.rock;
    } else if (input == 'B' || input == 'Y') {
      move = MoveSet.paper;
    } else if (input == 'C' || input == 'Z') {
      move = MoveSet.scissors;
    }
  }

  // Compare two moves
  int compare(RockPaperScissors other) {
    // Draw
    if (move.value == other.move.value) {
      return move.value + 3;
    }
    // Win
    if (move == MoveSet.rock && other.move == MoveSet.scissors ||
        move == MoveSet.paper && other.move == MoveSet.rock ||
        move == MoveSet.scissors && other.move == MoveSet.paper) {
      return move.value + 6;
    }
    // Loose
    return move.value;
  }

  int compareToWinCondition(String winCondition) {
    /* 
      X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. 
    */

    // Draw
    if (winCondition == 'Y') {
      return move.value + 3;
    }
    // Win
    if (winCondition == 'Z') {
      print(getOppositeMove(move).value);
      return getOppositeMove(move).value + 6;
    }
    // Loose
    if (winCondition == 'X') {
      print(getOppositeMove(move).value);
      return getOppositeMove(getOppositeMove(move)).value;
    }
    return 0;
  }

  MoveSet getOppositeMove(MoveSet moveset) {
    if (moveset == MoveSet.rock) {
      return MoveSet.paper;
    } else if (moveset == MoveSet.paper) {
      return MoveSet.scissors;
    } else {
      return MoveSet.rock;
    }
  }
}
