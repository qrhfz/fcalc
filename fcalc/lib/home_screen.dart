import 'package:fcalc/builtin_funcs_list.dart';
import 'package:fcalc/input_controller.dart';
import 'package:fcalc/keypad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calculate.dart';
import 'result_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final inputCtl = ref.watch(inputCtlProv);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  const Expanded(child: ResultView()),
                  TextField(
                    keyboardType: TextInputType.none,
                    autofocus: true,
                    controller: inputCtl,
                    showCursor: true,
                    style: const TextStyle(fontSize: 24),
                    onSubmitted: (_) {
                      final src = inputCtl.text;
                      ref.read(calculateProv)(src);
                      inputCtl.clear();
                    },
                    onEditingComplete: () {
                      focus.requestFocus();
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 8,
              child: ref.watch(showKeypadProv)
                  ? const Keypad()
                  : const FuncListView(),
            )
          ],
        ),
      ),
    );
  }
}

class FuncListView extends ConsumerStatefulWidget {
  const FuncListView({super.key});

  @override
  ConsumerState<FuncListView> createState() => _FuncListViewState();
}

class _FuncListViewState extends ConsumerState<FuncListView> {
  String filterText = "";
  List<FuncSig> get filtered => builtinFuncsList
      .where((item) => item.signature.contains(filterText))
      .toList();

  @override
  Widget build(context) {
    final inputCtl = ref.watch(inputCtlProv);

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(showKeypadProv.notifier).state = true;
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                    onChanged: (v) => setState(() => filterText = v),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (c, i) {
              return ListTile(
                title: Text(filtered[i].signature),
                subtitle: Text(filtered[i].docs),
                onTap: () {
                  inputCtl.text += filtered[i].signature;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

final showKeypadProv = StateProvider((ref) => true);
