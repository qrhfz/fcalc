import 'package:fcalc/calculate.dart';
import 'package:fcalc/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Keypad extends ConsumerStatefulWidget {
  const Keypad({
    super.key,
  });

  @override
  ConsumerState<Keypad> createState() => _KeypadState();
}

class _KeypadState extends ConsumerState<Keypad> {
  late TextEditingController inputCtl;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => inputCtl = ref.watch(inputCtlProv));
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        ExpandedRow(
          children: [
            KeypadButton(text: "(", onPressed: lParen),
            KeypadButton(text: ")", onPressed: rParen),
            KeypadButton(text: "%", onPressed: percent),
            KeypadButton(text: "⇦", onPressed: del),
          ],
        ),
        ExpandedRow(children: [
          KeypadButton(text: "7", onPressed: seven),
          KeypadButton(text: "8", onPressed: eight),
          KeypadButton(text: "9", onPressed: nine),
          KeypadButton(text: "/", onPressed: divide),
        ]),
        ExpandedRow(
          children: [
            KeypadButton(text: "4", onPressed: four),
            KeypadButton(text: "5", onPressed: five),
            KeypadButton(text: "6", onPressed: six),
            KeypadButton(text: "×", onPressed: times),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "2", onPressed: two),
            KeypadButton(text: "3", onPressed: three),
            KeypadButton(text: "-", onPressed: minus),
            KeypadButton(text: "1", onPressed: one),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "^", onPressed: power),
            KeypadButton(text: "0", onPressed: zero),
            KeypadButton(text: "!", onPressed: factorial),
            KeypadButton(text: "+", onPressed: plus),
          ],
        ),
        ExpandedRow(
          children: [
            KeypadButton(text: "°", onPressed: degree),
            KeypadButton(text: ".", onPressed: dot),
            KeypadButton(text: "=", onPressed: equal),
            KeypadButton(text: "↵", onPressed: enter),
          ],
        ),
      ],
    );
  }

  void lParen() => inputCtl.text += "(";

  void rParen() => inputCtl.text += ")";

  void percent() => inputCtl.text += "%";

  void del() {
    if (inputCtl.text.isEmpty) {
      return;
    }
    inputCtl.text = inputCtl.text.substring(0, inputCtl.text.length - 1);
  }

  void seven() => inputCtl.text += "7";

  void eight() => inputCtl.text += "8";

  void nine() => inputCtl.text += "9";

  void divide() => inputCtl.text += "/";

  void four() => inputCtl.text += "4";

  void five() => inputCtl.text += "5";

  void six() => inputCtl.text += "6";

  void times() => inputCtl.text += '×';

  void one() => inputCtl.text += '1';

  void two() => inputCtl.text += '2';

  void three() => inputCtl.text += '3';

  void minus() => inputCtl.text += '-';

  void zero() => inputCtl.text += '0';

  void dot() => inputCtl.text += '.';

  void equal() => inputCtl.text += '=';

  void plus() => inputCtl.text += '+';

  void power() => inputCtl.text += '^';

  void factorial() => inputCtl.text += '!';

  void degree() => inputCtl.text += '°';

  void enter() {
    final src = inputCtl.text;
    ref.read(calculateProv)(src);
    inputCtl.clear();
  }
}

class KeypadButton extends StatelessWidget {
  const KeypadButton({required this.text, required this.onPressed, super.key});
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 24),
          ),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class ExpandedRow extends StatelessWidget {
  const ExpandedRow({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
