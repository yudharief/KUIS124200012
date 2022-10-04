import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kuis124200012/list_game.dart';
import 'package:url_launcher/url_launcher.dart';

class RincianGame extends StatefulWidget {
  final GameStore game;

  const RincianGame({Key? key, required this.game}) : super(key: key);

  @override
  State<RincianGame> createState() => _RincianGameState();
}

class _RincianGameState extends State<RincianGame> {
  @override
  bool isFavorite = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.game.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              // _launchURL(widget.album.albumurl);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height)/3,
            decoration: BoxDecoration(
              color: (isFavorite) ? Colors.orangeAccent : Colors.white,
            ),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.game.imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 15, top: 10),
                  decoration: BoxDecoration(
                    // color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                        spreadRadius: 7.0
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        widget.game.imageUrls[index],
                        width: 700,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Card(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.game.name,
                    style: TextStyle(
                        color: (isFavorite) ? Colors.amberAccent : Colors.black,
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   "Lokasi : ${widget.game.location}",
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container( //tentang
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      widget.game.about,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Genre : ${widget.game.tags}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Rilis: ${widget.game.releaseDate}\n",
                    style: TextStyle(
                        fontSize: 18,),
                  ),
                  Text(
                    "Rata-rata Ulasan: ${widget.game.reviewAverage}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Jumlah Ulasan: ${widget.game.reviewCount}",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Text(
                  //   "Link Game :",
                  // ),
                      // ElevatedButton.icon(
                      //
                      //   label: Text(
                      //     '',
                      //   ),
                      //   icon: Icon(Icons.web),
                      //   style:
                      //   ElevatedButton.styleFrom(
                      //     primary: Colors.purple,
                      //   ),
                      //   onPressed: () {
                      //     print('${widget.game.linkStore}');
                      //   },
                      // )
                  ElevatedButton(
                      child: Text(
                          'LINKNYA GAN\n',
                      ),
                      onPressed: () => launch('${widget.game.linkStore}'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
