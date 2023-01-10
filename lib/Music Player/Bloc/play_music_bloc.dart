import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wapp/Music%20Player/Data%20Provider/music_data.dart';

import '../Data Model/music_player_model.dart';
import '../Data Model/playlist_model.dart';

part 'play_music_event.dart';
part 'play_music_state.dart';

class PlayMusicBloc extends Bloc<PlayMusicEvent, PlayMusicState> {
  PlayMusicBloc() : super(PlayMusicInitial()) {
    on<PlayMusicEvent>((event, emit) {
      // TODO: implement event handler
      on<GetInitialData>((event,emit){
        emit(PlayMusicInitial());
      });
      on<ChangeFavourite>((event, emit) {
        emit(PlayMusicLoading());
        for (int i = 0; i < MusicDataProvider.allMusicList.length; i++) {
          if (event.musicModel.name == MusicDataProvider.allMusicList[i].name) {
            MusicDataProvider.allMusicList[i].isFavourite =
                !MusicDataProvider.allMusicList[i].isFavourite;
            MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[i];
          }
        }
        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));
      });

      on<PlayNext>((event, emit) {
        emit(PlayMusicLoading());
        if(MusicDataProvider.selectedIndex<MusicDataProvider.allMusicList.length - 1){
          MusicDataProvider.selectedIndex = MusicDataProvider.selectedIndex + 1;
          MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[MusicDataProvider.selectedIndex];
        }
        else{
          MusicDataProvider.selectedIndex=0;
          MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[MusicDataProvider.selectedIndex];
        }
        for(int i=0;i<MusicDataProvider.allMusicList.length;i++){
          if(i==MusicDataProvider.selectedIndex){
            MusicDataProvider.allMusicList[i].isPlaying = true;
          }
          else{
            MusicDataProvider.allMusicList[i].isPlaying = false;
          }
        }
        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });

      on<PlayPrevious>((event, emit) {
        emit(PlayMusicLoading());
         if(MusicDataProvider.selectedIndex==0){
          MusicDataProvider.selectedIndex=MusicDataProvider.allMusicList.length-1;
          MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[MusicDataProvider.selectedIndex];
        }
         else{
             MusicDataProvider.selectedIndex = MusicDataProvider.selectedIndex - 1;
             MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[MusicDataProvider.selectedIndex];
         }
        for(int i=0;i<MusicDataProvider.allMusicList.length;i++){
          if(i==MusicDataProvider.selectedIndex){
            MusicDataProvider.allMusicList[i].isPlaying = true;
          }
          else{
            MusicDataProvider.allMusicList[i].isPlaying = false;
          }
        }
        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });


      on<PlayPause>((event, emit) {
        emit(PlayMusicLoading());
        for (int i = 0; i < MusicDataProvider.allMusicList.length; i++) {
          if (event.musicModel.name == MusicDataProvider.allMusicList[i].name) {
            MusicDataProvider.allMusicList[i].isPlaying =
            !MusicDataProvider.allMusicList[i].isPlaying;
            MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[i];
          }
        }
        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });

      on<ChangeMusic>((event, emit) {
        emit(PlayMusicLoading());
        MusicDataProvider.selectedIndex = event.selectedMusicIndex;
        MusicDataProvider.selectedMusic = MusicDataProvider.allMusicList[MusicDataProvider.selectedIndex];
        for(int i=0;i<MusicDataProvider.allMusicList.length;i++){
          if(i==event.selectedMusicIndex){
            MusicDataProvider.allMusicList[i].isPlaying = true;
          }
          else{
            MusicDataProvider.allMusicList[i].isPlaying = false;
          }
        }
        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });

      on<AddPlaylist>((event, emit) {
        emit(PlayMusicLoading());
        if(event.playlistName.isNotEmpty && event.playlistName!=''){
          var playList = PlaylistModel(playlistName: event.playlistName,musicList: []);
          MusicDataProvider.playLists.add(playList);
        }

        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));


      });

      on<AddMusicOnPlaylist>((event, emit) {
        emit(PlayMusicLoading());
        for(int i=0;i<MusicDataProvider.playLists.length;i++){
          if(i==event.playlistIndex){
            MusicDataProvider.playLists[i].musicList.add(event.musicModel);
          }
        }

        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });


      on<DeletePlaylist>((event, emit) {
        emit(PlayMusicLoading());
        MusicDataProvider.playLists.removeAt(event.playlistIndex);

        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });

      on<DeleteMusicFromPlaylist>((event, emit) {
        emit(PlayMusicLoading());
        MusicDataProvider.playLists[event.playlistIndex].musicList.removeAt(event.musicIndex);
        emit(PlayMusicLoaded(
            allMusic: MusicDataProvider.allMusicList,
            selectedMusic: MusicDataProvider.selectedMusic,
            selectedMusicIndex: MusicDataProvider.selectedIndex,
            playlists: MusicDataProvider.playLists));

      });


    });
  }
}
