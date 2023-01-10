import '../Data Model/music_player_model.dart';
import '../Data Model/playlist_model.dart';

class MusicDataProvider {
  MusicDataProvider._();
  static final List<MusicModel> allMusicList = [
    MusicModel(
        name: 'Smoke',
        artist: 'Cowbell Cult',
        duration: 1.54,
        image:
            'https://images.unsplash.com/photo-1509114397022-ed747cca3f65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        isFavourite: false,
        isPlaying: true),
    MusicModel(
        name: 'Falling',
        artist: 'Trevor Daniel',
        duration: 2.39,
        image:
            'https://p16.resso.me/img/tos-alisg-i-0000/278b7a8589994efc9a53331993af9604~c5_750x750.jpg',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Astronaut In The Ocean',
        artist: 'Masked Wolf',
        duration: 2.12,
        image: 'https://i.scdn.co/image/ab67616d0000b2734303bef532de839bbdc0ed95',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Let Me Down Slowly',
        artist: 'Alec Benjamin',
        duration: 2.49,
        image: 'https://i.scdn.co/image/ab67616d0000b273459d675aa0b6f3b211357370',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Shape of You',
        artist: 'Ed Sheeran',
        duration: 3.53,
        image: 'https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Believer',
        artist: 'Imagine Dragons',
        duration: 3.24,
        image: 'https://i1.sndcdn.com/artworks-000475189980-9r6xiv-t500x500.jpg',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'I am a Mess',
        artist: 'Bebe Rexha',
        duration: 3.15,
        image: 'https://i1.sndcdn.com/artworks-AZ2omvdhkQ6JOq1n-os6fQg-t500x500.jpg',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Despacito',
        artist: 'Luis Fonsi,Daaddy Yankee',
        duration: 3.49,
        image: 'https://i.scdn.co/image/ab67616d0000b273ef0d4234e1a645740f77d59c',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Memories',
        artist: 'Maroon 5',
        duration: 3.09,
        image: 'https://i1.sndcdn.com/artworks-000611399920-ubvla0-t500x500.jpg',
        isFavourite: false,
        isPlaying: false),
    MusicModel(
        name: 'Faded',
        artist: 'Alan Walker',
        duration: 3.32,
        image: 'https://i.discogs.com/bxHmz-JHiwubu4RS4Wmjav4TmTUCaq0qbSKbM8V3YG0/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgwMjk0/NDYtMTQ1Mzc3MDM3/Ni0xNjc5LmpwZWc.jpeg',
        isFavourite: false,
        isPlaying: false),
  ];

  static int selectedIndex = 0;

  static MusicModel selectedMusic = allMusicList[selectedIndex];

  static List<PlaylistModel> playLists =[];
}


