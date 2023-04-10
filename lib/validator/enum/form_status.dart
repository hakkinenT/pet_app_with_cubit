enum FormStatus {
  initial,
  invalid,
  validated,
  inProgress,
  success,
  failure;

  bool get isInvalid => this == FormStatus.invalid;

  bool get isValidated => this == FormStatus.validated;

  bool get isInProgress => this == FormStatus.inProgress;

  bool get isSuccess => this == FormStatus.success;

  bool get isFailure => this == FormStatus.failure;
}
