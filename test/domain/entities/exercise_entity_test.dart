import 'package:flutter_test/flutter_test.dart';
import 'package:gym_book/domain/entities/excercise_entity.dart';

void main() {
  late ExerciseEntity sut;
  setUp(() {
    sut = ExerciseEntity(
      name: 'Bench Press',
      muscleGroup: 'Chest',
      repetitions: 10,
      sets: 3,
      weightLoad: 40,
    );
  });

  group('ExerciseEntity tests => ', () {
    test('should return a valid ExerciseEntity', () {
      expect(sut.name, 'Bench Press');
      expect(sut.muscleGroup, 'Chest');
      expect(sut.repetitions, 10);
      expect(sut.sets, 3);
      expect(sut.weightLoad, 40);
    });

    test('Should have a new value of 70 for weight', () {
      sut = sut.copyWith(weightLoad: 70);
      expect(sut.weightLoad, 70);
    });
  });
}
