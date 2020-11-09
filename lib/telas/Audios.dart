import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Audios extends StatefulWidget {
  @override
  _AudiosState createState() => _AudiosState();
}

class _AudiosState extends State<Audios> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");
  var i = 1;
  String temp = "silencer";
  String atual = "";
  String random = "";
  Random rand = new Random();

  bool playing = false; //botões de play e pause
  IconData playBtn = Icons.play_arrow;

  _play(String temp) async {
    if (atual != temp) {
      _parar();
      audioPlayer = await audioCache.play(temp + ".mp3");
      atual = temp;
    }
  }

  _resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      // success
    } else {
      print('Some error occured in resuming');
    }
  }

  _pausar() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
    }
  }

  _parar() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      // success
    }
  }

  _alphabeticalOrder() {
    _listaTarefas.sort();
  }

  @override
  void initState() {
    super.initState();
    audioCache.loadAll(_alphabeticalOrder());
  }

  List<String> _listaTarefas = [
    "silencer",
    "macarrao",
    "ranqueada",
    "boua",
    "carregar",
    "drogon",
    "esse void jogando",
    "fumou",
    "q disses",
    "um palhaço",
    "vamos capinar o lote",
    "num va acertar um hook",
    "ultaocara",
    "dont go",
    "eita man",
    "einstein",
    "vc é legenda",
    "para de falar irmio",
    "120",
    "adianta telar",
    "ai é um jogador",
    "canto da sereia",
    "comunicando com boludo",
    "cuato cara no mid",
    "intimando o falen",
    "jimbreal sinonimos",
    "kd os donate",
    "lancha lancha remix",
    "lanchados",
    "liga e fala alguma coisa",
    "ligando na gvt",
    "omni cara",
    "para de falar irmio",
    "q q isso valve",
    "quem disse que eu vo jogar com vcs",
    "sou tri campeao goiano",
    "usa malevolence",
    "varios tp no mid",
    "vc é legenda",
    "vc n sabe da uma rolada",
    "vem roshan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              //Colors.yellow[200],
              Colors.pinkAccent,
              Colors.orangeAccent,
              Colors.blueAccent[700],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 45, left: 10),
                  child: Text(
                    "SeuCreysson",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SnackDetector(), //snack bar
              ],
            ),
            Container(
              //color: Colors.grey,
              margin: EdgeInsets.only(bottom: 20, left: 10),
              padding: EdgeInsets.only(bottom: 0, left: 0),
              //padding: EdgeInsets.only(bottom: 20, left: 10),
              alignment: Alignment.topLeft,
              child: Text(
                "Sounds",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              //color: Colors.grey,
              // margin: EdgeInsets.only(bottom: 0, left: 0),
              // padding: EdgeInsets.only(bottom: 0, top: 0),
              onTap: () {
                random = _listaTarefas[rand.nextInt(_listaTarefas.length)];
                _play(random);
                print(random);
                setState(() {
                  atual = random;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/imagens/creyretro.png",
                  fit: BoxFit.cover,
                  height: 210.0,
                  width: 210.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0, left: 0),
              padding: EdgeInsets.only(bottom: 0, left: 0),
              //alignment: Alignment.center,
              child: Text(
                atual,
                style: TextStyle(
                  //color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              //height: 20,
              decoration: BoxDecoration(
                  //color: Colors.green,
                  ),
              child: Container(
                //color: Colors.green,
                padding: EdgeInsets.only(bottom: 10),
                margin: EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 0),
                      //color: Colors.yellow,
                      child: IconButton(
                        iconSize: 35,
                        color: Colors.black,
                        icon: Icon(Icons.pause),
                        onPressed: () {
                          _pausar();
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      //color: Colors.pink,
                      child: IconButton(
                        iconSize: 45,
                        color: Colors.black,
                        icon: Icon(Icons.play_arrow_sharp),
                        onPressed: () {
                          _resume();
                          print(atual);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      //color: Colors.green,
                      child: IconButton(
                        iconSize: 35,
                        color: Colors.black,
                        icon: Icon(Icons.stop),
                        onPressed: () {
                          _parar();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  itemCount: _listaTarefas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white24,
                      ),
                      child: FlatButton(
                        child: ListTile(
                          title: Text(_listaTarefas[index]),
                          subtitle: Text("#$index"),
                        ),
                        onPressed: () {
                          _play(_listaTarefas[index]);

                          setState(() {
                            atual = _listaTarefas[index];
                            print(atual);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnackDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      margin: EdgeInsets.only(left: 150),
      padding: EdgeInsets.only(top: 25),
      child: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "Aperta no Crey que da randon.\n(v 0.1) Created by Galerito"),
              ),
            );
          }),
    );
  }
}
