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

class VariableUnddefinedError implements Exception {
  final String name;

  VariableUnddefinedError(this.name);

  @override
  String toString() {
    return "variable $name is undefined";
  }
}

class FunctionUnddefinedError implements Exception {
  final String name;

  FunctionUnddefinedError(this.name);

  @override
  String toString() {
    return "function $name is undefined";
  }
}

class SyntaxError implements Exception {
  @override
  String toString() {
    return "syntax error";
  }
}
