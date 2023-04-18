part of 'play_music_bloc.dart';

@immutable
abstract class PlayMusicState {}

class PlayMusicInitial extends PlayMusicState {}

class PlayMusicLoading extends PlayMusicState {}

class PlayMusicLoaded extends PlayMusicState {
  final List<MusicModel> allMusic;
  final MusicModel selectedMusic;
  final int selectedMusicIndex;
  final List<PlaylistModel> playlists;
  PlayMusicLoaded(
      {required this.allMusic,
      required this.selectedMusic,
      required this.selectedMusicIndex,
      required this.playlists});
}
