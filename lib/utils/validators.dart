class ProjectValidator {
  static String? intFieldValidator(String? input) {
    const errorMessage = 'Input must be positive integer';
    if (input == null) {
      return errorMessage;
    } else {
      final parsedInt = int.tryParse(input);
      if (parsedInt == null || parsedInt < 1) {
        return errorMessage;
      } else {
        return null;
      }
    }
  }
}
