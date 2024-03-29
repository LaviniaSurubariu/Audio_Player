import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer player = AudioPlayer();
  final List<String> words = <String>['salut', 'ma numesc', 'cum esti?', 'sunt bine'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Audio Player'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                player.seek(Duration.zero);
                player.play(AssetSource('0${index + 1}.mp3'));
              },
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.lightBlue,
                      Colors.lightBlueAccent,
                    ])),
                child: SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                        index.isEven
                            ? words.elementAt((index / 2).floor())
                            : '${words.elementAt((index / 2).floor())} (Germana)',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
