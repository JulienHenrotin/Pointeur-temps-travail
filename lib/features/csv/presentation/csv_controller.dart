import 'package:flutter/foundation.dart';
import '../../../core/result.dart';
import '../data/csv_repository.dart';


class CsvController extends ChangeNotifier {
CsvController(this._repo);


final CsvRepository _repo;


String status = 'Prêt.';
String content = '';
bool busy = false;


String get filePath => _repo.filePath;


Future<void> readCsv() async {
if (busy) return; busy = true; notifyListeners();
final res = await _repo.readFile();
switch (res) {
case Ok<String>(value: final raw):
status = 'Lecture OK (${raw.length} caractères).';
content = raw;
case Err<String>(error: final e):
status = 'Erreur lecture: $e';
}
busy = false; notifyListeners();
}


Future<void> appendRow() async {
if (busy) return; busy = true; notifyListeners();
final res = await _repo.appendRandomRow();
switch (res) {
case Ok<void>():
status = 'Écriture OK (ligne ajoutée).';
case Err<void>(error: final e):
status = 'Erreur écriture: $e';
}
busy = false; notifyListeners();
}
}