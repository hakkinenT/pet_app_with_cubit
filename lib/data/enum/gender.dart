enum Gender {
  empty,
  female,
  male;

  String get value => this == Gender.empty
      ? "Vazio"
      : this == Gender.male
          ? "Macho"
          : "Fêmea";

  bool get isEmpty => this == Gender.empty;

  bool get isFemale => this == Gender.female;

  bool get isMale => this == Gender.male;
}
