import 'music_player_model.dart';

class PlaylistModel{
  String playlistName;
  List<MusicModel> musicList=[];
  PlaylistModel({required this.playlistName,required this.musicList});
}