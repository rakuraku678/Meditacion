class SongModel {
  String name;
  String bgImage;
  String duration;
  bool isPremium;

  SongModel(
      {required this.name,
      required this.bgImage,
      required this.duration,
      required this.isPremium});

  static List<SongModel> getDescansarMejorSongs() {
    List<SongModel> songs = [];

    songs.add(SongModel(
        name: 'En el bosque',
        bgImage: 'assets/bgs/zen1.jpeg',
        duration: '30 mins',
        isPremium: true));

    songs.add(SongModel(
        name: 'Lluvia',
        bgImage: 'assets/bgs/zen1.jpeg',
        duration: '20 mins',
        isPremium: false));

    return songs;
  }

  static List<SongModel> getMusicaParaMeditarSongs() {
    List<SongModel> songs = [];

    songs.add(SongModel(
        name: 'Meditacion 1',
        bgImage: 'assets/bgs/zen2.jpeg',
        duration: '4 mins',
        isPremium: false));

    songs.add(SongModel(
        name: 'Meditacion 2',
        bgImage: 'assets/bgs/zen2.jpeg',
        duration: '5 mins',
        isPremium: false));

    songs.add(SongModel(
        name: 'Meditacion 3',
        bgImage: 'assets/bgs/zen2.jpeg',
        duration: '15 mins',
        isPremium: true));

    return songs;
  }
}
