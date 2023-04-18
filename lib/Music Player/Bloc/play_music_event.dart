part of 'play_music_bloc.dart';

@immutable
abstract class PlayMusicEvent {}
class GetInitialData extends PlayMusicEvent{}

class ChangeFavourite extends PlayMusicEvent{
  final MusicModel musicModel;
  ChangeFavourite({required this.musicModel});
}
class PlayNext extends PlayMusicEvent{}

class PlayPrevious extends PlayMusicEvent{}

class PlayPause extends PlayMusicEvent{
  final MusicModel musicModel;
  PlayPause({required this.musicModel});
}

class ChangeMusic extends PlayMusicEvent{
  final int selectedMusicIndex;
  ChangeMusic({required this.selectedMusicIndex});
}

class AddPlaylist extends PlayMusicEvent{
  final String playlistName;
  AddPlaylist({required this.playlistName});
}

class AddMusicOnPlaylist extends PlayMusicEvent{
  final MusicModel musicModel;
  final int playlistIndex;
  AddMusicOnPlaylist({required this.playlistIndex,required this.musicModel});
}

class DeletePlaylist extends PlayMusicEvent{
  final int playlistIndex;
  DeletePlaylist({required this.playlistIndex});
}

class DeleteMusicFromPlaylist extends PlayMusicEvent{
  final int musicIndex;
  final int playlistIndex;
  DeleteMusicFromPlaylist({required this.playlistIndex,required this.musicIndex});
}