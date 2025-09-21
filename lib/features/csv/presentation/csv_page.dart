import 'package:flutter/material.dart';
import 'package:pointeur_temps_travail/features/csv/presentation/widget/csv_view.dart';
import '../../csv/data/csv_repository.dart';
import '../../csv/data/csv_service.dart';
import 'csv_controller.dart';


class CsvPage extends StatefulWidget {
const CsvPage({super.key});


@override
State<CsvPage> createState() => _CsvPageState();
}


class _CsvPageState extends State<CsvPage> {
late final CsvController controller;


@override
void initState() {
super.initState();
final repo = CsvRepository(CsvService());
controller = CsvController(repo);
}


@override
void dispose() {
controller.dispose();
super.dispose();
}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Demo CSV (Windows/Linux)')),
body: AnimatedBuilder(
animation: controller,
builder: (context, _) => CsvView(
filePath: controller.filePath,
status: controller.status,
content: controller.content,
busy: controller.busy,
onRead: controller.readCsv,
onWrite: controller.appendRow,
),
),
);
}
}