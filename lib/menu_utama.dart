import 'package:flutter/material.dart';
import 'package:kuis124200012/list_game.dart';
import 'package:kuis124200012/rincian_game.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Game Tersedia"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final GameStore game = gameList[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RincianGame(game: game)));
            },
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                            Colors.deepOrange.withOpacity(0.2),
                            BlendMode.dstOut),
                        image: NetworkImage(game.imageUrls[0]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          game.name,
                          style: TextStyle(
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          game.price,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ],
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          game.reviewAverage,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(10, 10))
                              ],
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
        itemCount: gameList.length,
      ),
    );
  }
}
