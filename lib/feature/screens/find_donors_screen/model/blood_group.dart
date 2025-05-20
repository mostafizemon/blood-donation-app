enum BloodGroup {
  aPositive('A+'),
  aNegative('A-'),
  bPositive('B+'),
  bNegative('B-'),
  abPositive('AB+'),
  abNegative('AB-'),
  oPositive('O+'),
  oNegative('O-');

  final String name;
  const BloodGroup(this.name);

  static BloodGroup? fromString(String value) {
    try {
      return BloodGroup.values.firstWhere((group) => group.name == value);
    } catch (_) {
      return null;
    }
  }
}
