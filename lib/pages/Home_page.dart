import 'package:drop_target/pages/Game_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widget/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Lottie.asset("assets/rasmlar/bird.json"),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  gameCard(
                      image: 'assets/rasmlar/hayvonlar.png',
                      name: 'Animals Game',
                      onTap: () {
                        Global.list = Global.animals;
                        Global.image = 'assets/rasmlar/img_1.png';
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const GamePage();
                        }));
                      }),
                  gameCard(
                      image: 'assets/rasmlar/mevalar.png',
                      name: 'Fruits Game',
                      onTap: () {
                        Global.list = Global.fruits;
                        Global.image = 'assets/mevalar/img_1.png';
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const GamePage();
                        }));
                      }),
                  gameCard(
                      image: 'assets/rasmlar/numbers.png',
                      name: 'Numbers Game',
                      onTap: () {
                        Global.list = Global.number;
                        Global.image = 'assets/raqamlar/img_1.png';
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const GamePage();
                        }));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gameCard({required String image, required String name, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Row(
            children: [
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),child: Image.asset(
              image,
              width: 120,
              height: 100,
            ),
            ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
