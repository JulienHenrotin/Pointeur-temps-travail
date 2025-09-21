import 'package:flutter/material.dart';
import 'features/csv/presentation/csv_page.dart';


class App extends StatelessWidget {
const App({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'CSV Demo',
debugShowCheckedModeBanner: false,
theme: ThemeData(useMaterial3: true),
home: const CsvPage(),
);
}
}