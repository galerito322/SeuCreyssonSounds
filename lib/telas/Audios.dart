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

  int i = 1; //contador
  String temp = "silencer";
  String atual = "322";
  String random = "";

  Random rand = new Random();

  bool first =
      true; //first verifica se é a primeira vez que o app foi executado

  //bool playing = false; //botões de play e pause
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
    //"para de falar irmio",
    "conhece o 120",
    "adianta telar",
    "ai é um jogador",
    "canto da sereia",
    "cuato cara no mid",
    "intimando o falen",
    "jimbreal sinonimos",
    "kd os donate",
    "lancha lancha remix",
    "lanchados",
    "liga e fala alguma coisa",
    "ligando na gvt",
    "omni cara",
    "q q isso valve",
    "quem disse que eu vo jogar com vcs",
    "sou tri campeao goiano",
    "usa malevolence",
    "varios tp no mid",
    "vc é legenda",
    "vc n sabe da uma rolada",
    "vem roshan",
    "bate papo uol",
    "callate hijo de mil pultas",
    "cheiro da bosta",
    "como q esse cara ta correndo tanto",
    "depressão da onde",
    "desgraçado saiu do jogo",
    "eu que to zuando o jogo",
    "eu sou o sniper",
    "hr de vc dormir",
    "lancha lancha gretchen",
    "macarrao q poha de ban rapaz",
    "maior controlador de unidades",
    "me responde na pagina",
    "nun da empale ai n",
    "o mais lixo que eu ja vi",
    "pqr q q se tirou o galo",
    "pudg suporte",
    "quem tem dó do mendigo",
    "resumo do patch",
    "se tem q melhorar mt",
    "seis n vao jogar mais cmg",
    "soy lucas codorna",
    "tu é horrivel de mais cara",
    "ai é intelegente",
    "depoimento aluno loucademia",
    "e para de me ligar zbc",
    "o jogo ja acabou seus inbecil",
    "q troxa oq rapaz",
    "vc é um sup 5 animal",
    "direitos da loucademia",
    "seis demoraram pra achar game",
  ];

  @override
  Widget build(BuildContext context) {
    if (first) {
      //inicia musica ao abrir o app
      _play("lancha lancha remix");
      first = false;
    }
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
              margin: EdgeInsets.only(top: 5, left: 0),
              padding: EdgeInsets.only(bottom: 0, left: 0),
              //alignment: Alignment.center,
              child: Text(
                atual.capitalize(),
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
                    i = index +
                        1; //i recebe index + 1 para que a contagem seja feita a partir do numero 1 e nao 0
                    return Container(
                      height: 57,
                      //padding: EdgeInsets.only(top: 0),
                      margin: EdgeInsets.only(bottom: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white24,
                      ),
                      child: FlatButton(
                        child: ListTile(
                          title: Text(
                            "$i. " + _listaTarefas[index].capitalize(),
                          ), //.capitalize trata a string deixando a primeira letra maiuscula
                          //subtitle: Text("$i"),
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
                    "Aperta no Crey que da random. \nVersion 0.1 / © Galerito."),
              ),
            );
          }),
    );
  }
}

//Primeira letra Maiuscula
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
