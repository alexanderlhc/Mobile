import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
          home: Scaffold (
              appBar: AppBar(
                  title: Text('007'),
                  centerTitle: true,
              ),
              body: Character(),
          )
  ));
}

////////////// Helpers

class CharacterData {
    static final String dc = "daniel_craig";
    static final String gl = "george_lazenby";
    static final String pb = "pierce_brosnan";
    static final String rm = "roger_moore";
    static final String sc = "sean_connery";
    static final String td = "timothy_dalton";
    static final String kb = "kabir_bedi";
    static final String hs = "harold_sakata";
    static final Set<String> characters = {dc, gl, pb, rm, sc, td, kb, hs};
    static final Random rng = new Random();

  static randomCharacter({Set<String> history}) {
      int characterAt = new Random().nextInt(characters.length - history.length);
      return characters.difference(history).elementAt(characterAt);
  }
}



////////////// Widgets

class Character extends StatefulWidget {
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  String _character = "daniel_craig";
  Set<String> history = new Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container (
            color: Colors.pink,
            child: Center(
                child: Image.asset(
                'assets/images/${_character}.png',
                height: 700
                )
            )
        ),
        floatingActionButton: FloatingActionButton(
            child: Text('+'),
            onPressed: () {
              _newRandomCharacter();
            }
        )
    );
  }


  void _newRandomCharacter() {
    setState(() {
          if (history.length == CharacterData.characters.length) history.clear();
          String newCharacter = CharacterData.randomCharacter(history: history);
          history.add(newCharacter);
          _character = newCharacter;
        });
  }
}

