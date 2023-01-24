import 'package:flutter_test/flutter_test.dart';
import 'package:gym_book/domain/entities/excercise_entity.dart';
import 'package:gym_book/domain/entities/workout_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockExerciseEntity extends Mock implements ExerciseEntity {}

void main() {
  late ExerciseEntity mockExercise1;
  late ExerciseEntity mockExercise2;
  late ExerciseEntity mockExercise3;
  late ExerciseEntity mockExercise4;
  late List<ExerciseEntity> exercises;
  late WorkoutEntity sut;

  setUp(() {
    mockExercise1 = MockExerciseEntity();
    mockExercise2 = MockExerciseEntity();
    mockExercise3 = MockExerciseEntity();
    mockExercise4 = MockExerciseEntity();
    exercises = [
      mockExercise1,
      mockExercise2,
      mockExercise3,
      mockExercise4,
    ];
    sut = WorkoutEntity(
      nickname: 'A',
      date: DateTime.now(),
      excercises: exercises,
    );
  });

  group('WorkoutEntity tests => ', () {
    test('Should have a list of at least one exercise', () {
      expect(sut.excercises.length, greaterThanOrEqualTo(1));
    });
    test('Should have a nickname', () {
      expect(sut.nickname, isNotEmpty);
    });

    test('Should have a date', () {
      expect(sut.date, isA<DateTime>());
    });

    test(
        'is valid if has a nickname, date not future and at least one exercise',
        () {
      expect(sut.validate, returnsNormally);
    });
  });
}
