import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Hero or Villain",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Agent(),
    );
  }
}


class Agent extends StatefulWidget {

  @override
  _AgentState createState() => _AgentState();

}

class _AgentState extends State<Agent> {

  String _agent = "daniel_craig.png";

  @override
  Widget build(BuildContext context) {

    return Container(
          child: Column(
              children: [
                GestureDetector(
                  onTap: _randomAgent,
                  child: Image.asset(
                      'assets/images/$_agent',
                      height: 500,
                    ),
                ),
                Text('${_agent.split("_")[0].toUpperCase()}', textScaleFactor: 0.7),
              ]
          ),
          height: 10,
    );

  }

  _randomAgent() {
    String dc = "daniel_craig.png";
    String gl = "george_lazenby.png";
    String pb = "pierce_brosnan.png";
    String rm = "roger_moore.png";
    String sc = "sean_connery.png";
    String td = "timothy_dalton.png";
    List<String> agents = [dc, gl, pb, rm, sc, td];


    setState(() {
      _agent = agents[new Random().nextInt(agents.length)];
    });
  }
}
