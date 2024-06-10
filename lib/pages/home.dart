import 'package:fitness/constants.dart';
import 'package:fitness/models/song_model.dart';
import 'package:fitness/pages/music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<SongModel> musicaParaMeditarSongs = [];
  List<SongModel> descansarMejorSongs = [];

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
                      MaterialPageRoute(
                        builder: (context) => MusicPlayerPage(
                            songName: songsList[index].name,
                            bgImage: songsList[index].bgImage),
                      ));
                },
                child: Container(
                  width: 210,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(songsList[index].bgImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      if (songsList[index].isPremium)
                        Positioned(
                            top: 5,
                            right: 5,
                            child: SvgPicture.asset(
                              'assets/icons/premium-icon.svg',
                              width: 25,
                              height: 25,
                            )),
                      Positioned(
                          bottom: 0,
                          left: 6,
                          right: 6,
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                                color: colorOpaque,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                songsList[index].duration,
                                style: textStyleDuration,
                              ),
                            ),
                          ))
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
