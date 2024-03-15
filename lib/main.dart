import 'package:flutter/material.dart';
import 'package:next_pe_task/utils/router_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(primaryColor: Colors.purple[900]),
      routerConfig: GoRouterConfig.router,
    );
  }
}
