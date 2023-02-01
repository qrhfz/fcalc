import 'package:flutter_riverpod/flutter_riverpod.dart';

class History extends StateNotifier<List<HistoryEntry>> {
  History() : super([]);

  void add({required String input, required num? result}) {
    state = [...state, HistoryEntry(input: input, result: result)];
  }
}

final historyProv =
    StateNotifierProvider<History, List<HistoryEntry>>((ref) => History());

class HistoryEntry {
  final String input;
  final num? result;

  HistoryEntry({required this.input, this.result});
}
