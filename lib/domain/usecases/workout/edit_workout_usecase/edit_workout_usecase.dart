import '../../../entities/excercise_entity.dart';
import '../../../entities/workout_entity.dart';

enum TypeOfEdit {
  addExercise,
  removeExercise,
  updateExercise,
  updateWorkout,
}

abstract class EditWorkoutUseCase {
  Future<WorkoutEntity> call({
    required WorkoutEntity workout,
    required TypeOfEdit typeOfEdit,
    ExerciseEntity? exercise,
  });
}
