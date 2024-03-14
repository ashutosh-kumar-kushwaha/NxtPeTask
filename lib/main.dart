import 'package:flutter/material.dart';
import 'package:next_pe_task/presentation/ui/routes.dart';
import 'package:next_pe_task/presentation/ui/routes_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[900]),
      initialRoute: RoutesName.listing,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
