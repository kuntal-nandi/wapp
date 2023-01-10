part of 'play_music_bloc.dart';

@immutable
abstract class PlayMusicEvent {}
class GetInitialData extends PlayMusicEvent{}

class ChangeFavourite extends PlayMusicEvent{
  MusicModel musicModel;
  ChangeFavourite({required this.musicModel});
}
class PlayNext extends PlayMusicEvent{}

class PlayPrevious extends PlayMusicEvent{}

class PlayPause extends PlayMusicEvent{
  MusicModel musicModel;
  PlayPause({required this.musicModel});
}

class ChangeMusic extends PlayMusicEvent{
  int selectedMusicIndex;
  ChangeMusic({required this.selectedMusicIndex});
}

class AddPlaylist extends PlayMusicEvent{
  String playlistName;
  AddPlaylist({required this.playlistName});
}

class AddMusicOnPlaylist extends PlayMusicEvent{
  MusicModel musicModel;
  int playlistIndex;
  AddMusicOnPlaylist({required this.playlistIndex,required this.musicModel});
}

class DeletePlaylist extends PlayMusicEvent{
  int playlistIndex;
  DeletePlaylist({required this.playlistIndex});
}

class DeleteMusicFromPlaylist extends PlayMusicEvent{
  int musicIndex;
  int playlistIndex;
  DeleteMusicFromPlaylist({required this.playlistIndex,required this.musicIndex});
}