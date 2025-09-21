import 'package:flutter/material.dart';


class CsvView extends StatelessWidget {
const CsvView({
super.key,
required this.filePath,
required this.status,
required this.content,
required this.busy,
required this.onRead,
required this.onWrite,
});


final String filePath;
final String status;
final String content;
final bool busy;
final VoidCallback onRead;
final VoidCallback onWrite;


@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Wrap(
spacing: 12,
runSpacing: 8,
crossAxisAlignment: WrapCrossAlignment.center,
children: [
ElevatedButton(
onPressed: busy ? null : onRead,
child: const Text('Lire CSV'),
),
FilledButton(
onPressed: busy ? null : onWrite,
child: const Text('Écrire CSV'),
),
Text(
filePath,
style: Theme.of(context).textTheme.bodySmall,
overflow: TextOverflow.ellipsis,
),
if (busy) const Padding(
padding: EdgeInsets.only(left: 8),
child: SizedBox(
width: 16,
height: 16,
child: CircularProgressIndicator(strokeWidth: 2),
),
),
],
),
const SizedBox(height: 8),
Text(status, style: Theme.of(context).textTheme.labelMedium),
const SizedBox(height: 12),
Expanded(
child: Container(
width: double.infinity,
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
border: Border.all(color: Colors.black12),
borderRadius: BorderRadius.circular(8),
),
child: SingleChildScrollView(
child: Text(
content.isEmpty ? 'Contenu CSV affiché ici…' : content,
style: const TextStyle(fontFamily: 'monospace'),
),
),
),
),
],
),
);
}
}