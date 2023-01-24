import 'excercise_entity.dart';

class WorkoutEntity {
  final String nickname;
  final DateTime date;
  final List<ExerciseEntity> excercises;
  final Duration? restTimeBetweenSets;
  final Duration? timeSpent;

  WorkoutEntity({
    required this.nickname,
    required this.date,
    required this.excercises,
    this.restTimeBetweenSets,
    this.timeSpent,
  });

  validate() {
    if (nickname.isEmpty) {
      throw Exception('Nickname cannot be empty');
    }
    if (excercises.isEmpty) {
      throw Exception('Workout must have at least one exercise');
    }
    if (date.isAfter(DateTime.now())) {
      throw Exception('Date cannot be in the future');
    }
  }

  WorkoutEntity copyWith({
    String? nickname,
    DateTime? date,
    List<ExerciseEntity>? excercises,
    Duration? restTimeBetweenSets,
    Duration? timeSpent,
  }) {
    return WorkoutEntity(
      nickname: nickname ?? this.nickname,
      date: date ?? this.date,
      excercises: excercises ?? this.excercises,
      restTimeBetweenSets: restTimeBetweenSets ?? this.restTimeBetweenSets,
      timeSpent: timeSpent ?? this.timeSpent,
    );
  }
}
