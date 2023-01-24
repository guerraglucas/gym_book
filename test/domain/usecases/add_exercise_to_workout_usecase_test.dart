import 'package:flutter_test/flutter_test.dart';
import 'package:gym_book/domain/entities/excercise_entity.dart';
import 'package:gym_book/domain/entities/workout_entity.dart';
import 'package:gym_book/domain/repositories/workout_repository.dart';
import 'package:gym_book/domain/usecases/workout/edit_workout_usecase/edit_workout_usecase.dart';
import 'package:gym_book/domain/usecases/workout/edit_workout_usecase/edit_workout_usecase_imp.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  late ExerciseEntity mockExercise1;
  late ExerciseEntity mockExercise2;
  late List<ExerciseEntity> exercises;

  late WorkoutEntity mockWorkout;

  late WorkoutRepository mockWorkoutRepository;
  late EditWorkoutUseCase sut;

  setUp(() {
    mockExercise1 = ExerciseEntity(
      name: 'Bench Press',
      muscleGroup: 'Chest',
      repetitions: 10,
      sets: 3,
      weightLoad: 40,
    );
    mockExercise2 = ExerciseEntity(
      name: 'Squat',
      muscleGroup: 'Legs',
      repetitions: 10,
      sets: 3,
      weightLoad: 40,
    );
    exercises = [mockExercise1, mockExercise2];
    mockWorkout = WorkoutEntity(
      nickname: 'A',
      date: DateTime.now(),
      excercises: exercises,
    );

    mockWorkoutRepository = MockWorkoutRepository();
    sut = EditWorkoutUseCaseImp(mockWorkoutRepository);
  });

  group('addExerciseToWorkoutUseCase tests => ', () {
    test('Should add an exercise to the workout', () async {
      int startingLength = mockWorkout.excercises.length;
      ExerciseEntity newExercise = ExerciseEntity(
        name: 'Bench Press',
        sets: 3,
        repetitions: 10,
        weightLoad: 100,
      );
      when(() => mockWorkoutRepository.addExerciseToWorkout(
            mockWorkout,
            newExercise,
          )).thenAnswer((_) async => mockWorkout.copyWith(
            excercises: [...mockWorkout.excercises, newExercise],
          ));
      WorkoutEntity editedWorkout = await sut(
        workout: mockWorkout,
        typeOfEdit: TypeOfEdit.addExercise,
        exercise: newExercise,
      );
      expect(editedWorkout.excercises.length, greaterThan(startingLength));
    });

    test('Should remove an exercise from the workout', () async {
      int startingLength = mockWorkout.excercises.length;
      when(() => mockWorkoutRepository.removeExerciseFromWorkout(
            mockWorkout,
            mockExercise1,
          )).thenAnswer((_) async => mockWorkout.copyWith(
            excercises: mockWorkout.excercises
                .where((exercise) => exercise != mockExercise1)
                .toList(),
          ));
      WorkoutEntity editedWorkout = await sut(
        workout: mockWorkout,
        typeOfEdit: TypeOfEdit.removeExercise,
        exercise: mockExercise1,
      );
      expect(editedWorkout.excercises.length, lessThan(startingLength));
    });
  });
}
