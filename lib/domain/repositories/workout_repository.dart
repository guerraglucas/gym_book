import '../entities/excercise_entity.dart';
import '../entities/workout_entity.dart';

abstract class WorkoutRepository {
  Future<WorkoutEntity> addExerciseToWorkout(
    WorkoutEntity workout,
    ExerciseEntity exercise,
  );

  Future<WorkoutEntity> removeExerciseFromWorkout(
    WorkoutEntity workout,
    ExerciseEntity exercise,
  );

  Future<WorkoutEntity> updateExerciseInWorkout(
    WorkoutEntity workout,
    ExerciseEntity exercise,
  );

  Future<WorkoutEntity> updateWorkout(WorkoutEntity workout);
}
