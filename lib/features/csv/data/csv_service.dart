import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:csv/csv.dart';


/// Service le plus bas niveau : lecture/écriture disque.
class CsvService {
CsvService({Directory? baseDir}) : _baseDir = baseDir ?? Directory.current;


final Directory _baseDir;
final String fileName = 'data.csv';


String get filePath => p.join(_baseDir.path, fileName);


Future<File> ensureFile() async {
final file = File(filePath);
if (!await file.exists()) {
await file.create(recursive: true);
final header = const ListToCsvConverter().convert([
['timestamp', 'value']
]);
await file.writeAsString('$header\n', mode: FileMode.write);
}
return file;
}


Future<String> readRaw() async {
final file = await ensureFile();
return file.readAsString();
}


Future<void> appendRow(List<dynamic> row) async {
final file = await ensureFile();
final csvLine = const ListToCsvConverter().convert([row]);
await file.writeAsString('$csvLine\n', mode: FileMode.append);
}
}