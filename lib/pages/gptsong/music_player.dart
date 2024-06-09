import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerPage extends StatefulWidget {
  final String songName;
  final String bgImage;

  const MusicPlayerPage(
      {super.key, required this.songName, required this.bgImage});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  var opaqueColor = const Color.fromARGB(100, 0, 0, 0);

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void _playMusic() async {
    await _audioPlayer.play(UrlSource(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    //await _audioPlayer.play(AssetSource('audio/temako.mp3'));
    setState(() {
      isPlaying = true;
    });
  }

  void _pauseMusic() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.songName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(widget.bgImage),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64.0,
              color: Colors.white,
              onPressed: isPlaying ? _pauseMusic : _playMusic,
            ),
          ],
        ),
      )),
    );
  }
}
