import 'dart:math';
import 'package:intl/intl.dart';
import '../../../core/result.dart';
import 'csv_service.dart';


/// Couche "métier" simplifiée.
class CsvRepository {
CsvRepository(this._service);
final CsvService _service;


String get filePath => _service.filePath;


Future<Result<String>> readFile() async {
try {
final raw = await _service.readRaw();
return Ok(raw);
} catch (e) {
return Err(e);
}
}


Future<Result<void>> appendRandomRow() async {
try {
final now = DateTime.now().toUtc();
final ts = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(now);
final value = Random().nextInt(1000);
await _service.appendRow([ts, value]);
return const Ok(null);
} catch (e) {
return Err(e);
}
}
}