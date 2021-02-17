import 'package:flutter/material.dart';

import 'Agents.dart';

void main() {
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => AgentsSW(),
          AgentSW.routeName: (context) => AgentSW(new Agent("Sean Connery")),
        },
    );
  }
}
