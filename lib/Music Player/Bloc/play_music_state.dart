part of 'play_music_bloc.dart';

@immutable
abstract class PlayMusicState {}

class PlayMusicInitial extends PlayMusicState {}

class PlayMusicLoading extends PlayMusicState {}

class PlayMusicLoaded extends PlayMusicState {
  List<MusicModel> allMusic;
  MusicModel selectedMusic;
  int selectedMusicIndex;
  List<PlaylistModel> playlists;
  PlayMusicLoaded(
      {required this.allMusic,
      required this.selectedMusic,
      required this.selectedMusicIndex,
      required this.playlists});
}
