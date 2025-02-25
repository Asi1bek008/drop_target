import 'package:drop_target/model/Content.dart';
import 'package:drop_target/pages/Home_page.dart';
import 'package:flutter/material.dart';
import '../widget/global.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameCount = 0;
  List<Content> shuffledList = [];

  @override
  void initState() {
    super.initState();
    shuffledList = List.from(Global.list)..shuffle();
    for (var e in Global.list) {
      e.isDropped = false;
    }
  }


  void checkWinCondition() {
    if (gameCount == Global.list.length) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text(
                'Siz g\'libsiz!',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              actions: [
                TextButton(
                  onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                      return GamePage();
                    }));
                  },
                  child: const Text(
                    'Restart',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (Global.list == Global.animals) {
                      Global.list = Global.fruits;
                      Global.currentGame = 'fruits';
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => const GamePage()));
                    } else if (Global.list == Global.fruits) {
                      Global.list = Global.number;
                      Global.currentGame = 'numbers';
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => const GamePage()));
                    } else {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => const HomePage()));
                      return;
                    }

                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),

              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 10;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
            return HomePage();
          }));
        }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.blue.shade900,
        title: const Text(
         'Game',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: Global.list.map((e) {
                        return e.isDropped
                            ? SizedBox(height: height)
                            : Draggable(
                          data: e.value,
                          feedback: Image.asset(e.image, height:height,),
                          childWhenDragging: SizedBox(height: height,),
                          child: Image.asset(e.image, height: height,),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: shuffledList.map((e) {
                        return e.isDropped
                            ? SizedBox(height: height,)
                            : DragTarget(
                          onAccept: (data) {
                            if (e.value == data) {
                              setState(() {
                                e.isDropped = true;
                                gameCount++;
                                score += 10;
                                checkWinCondition();
                              });
                            }
                          },
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              height: height,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 5,
                                        spreadRadius: 2)
                                  ]),
                              child: Text(
                                e.value,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              color: Colors.white.withOpacity(0.4),
              child: Center(
                child: Text(
                  'Score: $score',
                  style: TextStyle(
                      color: Colors.brown.shade900,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
