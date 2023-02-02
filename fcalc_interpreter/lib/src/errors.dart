class ParameterError implements Exception {
  final String functionName;
  final int asked;
  final int given;

  ParameterError(this.functionName, this.asked, this.given);

  @override
  String toString() {
    return "$functionName: $asked parameter(s) asked, $given given.";
  }
}
