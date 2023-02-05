import 'package:built_collection/built_collection.dart';
import 'package:fcalc/init_script_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calculate.dart';
import 'debounce.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Init Script"),
            subtitle:
                const Text("Register your custom functions and variables"),
            onTap: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const InitScriptScreen();
            })),
          )
        ],
      ),
    );
  }
}

class InitScriptScreen extends ConsumerStatefulWidget {
  const InitScriptScreen({super.key});

  @override
  ConsumerState<InitScriptScreen> createState() => _InitScriptScreenState();
}

class _InitScriptScreenState extends ConsumerState<InitScriptScreen> {
  final _txtCtl = TextEditingController();
  Function(String)? captureRevision;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final vm = ref.read(initScriptViewModel);
      captureRevision = debounce<String>((text) {
        vm.insert(text);
      }, delay: const Duration(milliseconds: 500));

      vm.addListener(_sync);
    });
  }

  @override
  void dispose() {
    _txtCtl.dispose();
    super.dispose();
  }

  void _sync() {
    final vm = ref.read(initScriptViewModel);

    if (_txtCtl.text != vm.script) {
      _txtCtl.text = vm.script;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(initScriptViewModel);

    return WillPopScope(
      onWillPop: () async {
        if (vm.saved) {
          return true;
        }
        final dialogResult = await showDialog<bool>(
          context: context,
          builder: (_) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "You haven't saved last change",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text("Save and close"),
                    onPressed: () {
                      vm.save();
                      Navigator.of(context).pop(true);
                    },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    child: Text(
                      "Close without saving",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
        return dialogResult == true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Init Script"),
          actions: [
            IconButton(icon: const Icon(Icons.save), onPressed: vm.save),
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: vm.undoable ? vm.undo : null,
            ),
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: (vm.redoable) ? vm.redo : null,
            ),
          ],
        ),
        body: TextField(
          controller: _txtCtl,
          style: const TextStyle(fontFamily: "monospace"),
          decoration: const InputDecoration(border: InputBorder.none),
          maxLines: 100,
          onChanged: captureRevision,
        ),
      ),
    );
  }
}

class InitScriptViewModel extends ChangeNotifier {
  final InitScriptService _service;
  final Calculate _calc;
  BuiltList<String> _revisions = <String>[""].toBuiltList();
  int cur = 0;
  bool saved = true;

  InitScriptViewModel(this._service, this._calc) {
    init();
  }

  String get script => _revisions[cur];
  bool get undoable => cur > 0;
  bool get redoable => cur < _revisions.length - 1;

  Future<void> init() async {
    final script = await _service.read();
    _revisions = <String>[script].toBuiltList();
    notifyListeners();
  }

  void undo() {
    if (!undoable) {
      return;
    }
    cur -= 1;
    notifyListeners();
  }

  void redo() {
    if (!redoable) {
      return;
    }
    cur += 1;
    notifyListeners();
  }

  void insert(String input) {
    _revisions =
        _revisions.sublist(0, cur + 1).rebuild((builder) => builder.add(input));
    cur += 1;
    notifyListeners();
  }

  Future<void> save() async {
    await _service.save(script);
    await _calc.init();
    saved = true;
  }
}

final initScriptViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => InitScriptViewModel(
    ref.watch(initScriptServiceProv),
    ref.watch(calculateProv),
  ),
);
