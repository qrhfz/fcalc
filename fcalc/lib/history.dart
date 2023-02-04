import 'package:flutter_riverpod/flutter_riverpod.dart';

class History extends StateNotifier<List<HistoryEntry>> {
  History() : super([]);

  void add({required String input, num? result, String? error}) {
    state = [
      ...state,
      HistoryEntry(
        input: input,
        result: result,
        error: error,
      ),
    ];
  }
}

final historyProv =
    StateNotifierProvider<History, List<HistoryEntry>>((ref) => History());

class HistoryEntry {
  final String input;
  final num? result;
  final String? error;

  HistoryEntry({required this.input, this.result, this.error}) {
    if (result == null) {
      assert(error != null);
    }
  }
}
