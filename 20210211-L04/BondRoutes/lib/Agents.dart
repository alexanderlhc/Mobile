import 'package:flutter/material.dart';

class Agent {
  String name;

  Agent(this.name);

  Image image() {
    String path = "assets/images/" + name.toLowerCase().replaceAll(" ", "_");
    return Image.asset("${path}.png");
  }
}

class AgentsSW extends StatelessWidget {
  Agent dc = new Agent("Daniel Craig");
  Agent gl = new Agent("George Lazenby");
  Agent pb = new Agent("Pierce Brosnan");
  Agent rm = new Agent("Roger Moore");
  Agent sc = new Agent("Sean Connery");
  Agent td = new Agent("Timothy Dalton");
  Agent kb = new Agent("Kabir Uedi");
  Agent hs = new Agent("Harold Uakata");
  Agent bb = new Agent("Bogus Bogus");
  var agents;

  AgentsSW() { agents = <Agent>{dc, gl, pb, rm, sc, td, kb, hs, bb}; }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Bond Routes")),
        body: Center(
            child: Container(
                color: Colors.pinkAccent,
                child: ListView.separated(
                    itemCount: agents.length,
                    itemBuilder: (BuildContext context, int index) {
                      var agent = _getAgent(index);
                      return GestureDetector(
                          child: Container(
                              height: 50,
                              child: Center(child: Text(agent.name, textScaleFactor: 0.9)),
                          ),
                          onTap: () { _onclickAgent(context, agent); }
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
            )
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () { Navigator.pushNamed(context, '/agent', arguments: { id: 1}); },
        )
            );
  }

  Agent _getAgent(index) { return agents.elementAt(index); }

  _onclickAgent(BuildContext context, Agent agent) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AgentSW(agent)));
  }
}

class AgentSW extends StatelessWidget {
  static const routeName = '/agent';
  final Agent agent;

  AgentSW(this.agent);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);

    return Scaffold(
        appBar: AppBar(title: Text("Bond Routes!")),
        body: Center(
            child: Column(
                children: [
                  Text(agent.name, textScaleFactor: 3.5),
                  Expanded(
                      child: agent.image()
                  )
                ]
            )
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.keyboard_return_sharp),
            onPressed: () { Navigator.pop(context); },
        )
    );
  }
}
