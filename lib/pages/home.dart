import 'package:fitness/models/song_model.dart';
import 'package:fitness/pages/gptsong/music_player.dart';
import 'package:fitness/pages/songPages/song_detail_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'songPages/songs_tab.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<SongModel> musicaParaMeditarSongs = [];
  List<SongModel> descansarMejorSongs = [];

  var opaqueColor = const Color.fromARGB(100, 0, 0, 0);

  void _getInitialInfo() {
    descansarMejorSongs = SongModel.getDescansarMejorSongs();
    musicaParaMeditarSongs = SongModel.getMusicaParaMeditarSongs();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _musicCategoryColumn('Musica para meditar', musicaParaMeditarSongs),
          const SizedBox(
            height: 40,
          ),
          _musicCategoryColumn('Para descansar mejor', descansarMejorSongs),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Meditaciones Vivinescas',
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  Column _musicCategoryColumn(String catTitle, List<SongModel> songsList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "${"$catTitle (${songsList.length}"})",
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MusicPlayerPage()),
                  );
                },
                child: Container(
                  width: 210,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(songsList[index].bgImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 20,
                        width: 200,
                        decoration: BoxDecoration(
                            color: opaqueColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            songsList[index].duration,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: songsList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }
}
