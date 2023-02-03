class FuncSig {
  final String signature;

  final String docs;

  const FuncSig({
    required this.signature,
    required this.docs,
  });
}

const builtinFuncsList = [
  FuncSig(
    signature: "sin(x)",
    docs: "trigonometry sine function",
  ),
  FuncSig(
    signature: "cos(x)",
    docs: "trigonometry cosine function",
  ),
  FuncSig(
    signature: "tan(x)",
    docs: "trigonometry tangent function",
  ),
  FuncSig(
    signature: "mod(x,y)",
    docs: "modulo",
  ),
  FuncSig(
    signature: "log(x)",
    docs: "base 10 logarithm",
  ),
  FuncSig(
    signature: "√(x)",
    docs: "square root",
  ),
  FuncSig(
    signature: "ln(x)",
    docs: "natural logarithm",
  ),
];
