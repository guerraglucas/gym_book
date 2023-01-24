class ExerciseEntity {
  final String name;
  final String? muscleGroup;
  final int repetitions;
  final int sets;
  final int weightLoad;
  // final bool isCompleted;

  ExerciseEntity({
    required this.name,
    this.muscleGroup,
    required this.repetitions,
    required this.sets,
    required this.weightLoad,
    // required this.isCompleted,
  });

  ExerciseEntity copyWith({
    String? name,
    String? muscleGroup,
    int? repetitions,
    int? sets,
    int? weightLoad,
    // bool? isCompleted,
  }) {
    return ExerciseEntity(
      name: name ?? this.name,
      muscleGroup: muscleGroup ?? this.muscleGroup,
      repetitions: repetitions ?? this.repetitions,
      sets: sets ?? this.sets,
      weightLoad: weightLoad ?? this.weightLoad,
      // isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
