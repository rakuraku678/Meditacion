class SongModel {
  String name;
  String bgImage;
  String duration;

  SongModel(
      {required this.name, required this.bgImage, required this.duration});

  static List<SongModel> getDescansarMejorSongs() {
    List<SongModel> songs = [];

    songs.add(SongModel(
        name: 'Honey Pancake',
        bgImage: 'assets/bgs/zen1.jpeg',
        duration: '30 mins'));

    songs.add(SongModel(
        name: 'Canai Bread',
        bgImage: 'assets/bgs/zen1.jpeg',
        duration: '20 mins'));

    return songs;
  }

  static List<SongModel> getMusicaParaMeditarSongs() {
    List<SongModel> songs = [];

    songs.add(SongModel(
        name: 'Honey Pancake',
        bgImage: 'assets/bgs/zen2.jpeg',
        duration: '4 mins'));

    songs.add(SongModel(
        name: 'Canai Bread',
        bgImage: 'assets/bgs/zen2.jpeg',
        duration: '5 mins'));

    songs.add(SongModel(
        name: 'Canai Bread',
        bgImage: 'assets/bgs/zen2.jpeg',
        duration: '15 mins'));

    return songs;
  }
}
