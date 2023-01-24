import '../../../entities/excercise_entity.dart';
import '../../../entities/workout_entity.dart';

import '../../../repositories/workout_repository.dart';
import 'edit_workout_usecase.dart';

class EditWorkoutUseCaseImp implements EditWorkoutUseCase {
  final WorkoutRepository workoutRepository;

  EditWorkoutUseCaseImp(this.workoutRepository);
  @override
  Future<WorkoutEntity> call({
    required WorkoutEntity workout,
    required TypeOfEdit typeOfEdit,
    ExerciseEntity? exercise,
  }) async {
    switch (typeOfEdit) {
      case TypeOfEdit.addExercise:
        return workoutRepository.addExerciseToWorkout(workout, exercise!);
      case TypeOfEdit.removeExercise:
        return workoutRepository.removeExerciseFromWorkout(workout, exercise!);
      case TypeOfEdit.updateExercise:
        return workoutRepository.updateExerciseInWorkout(workout, exercise!);
      case TypeOfEdit.updateWorkout:
        return workoutRepository.updateWorkout(workout);
    }
  }
}
