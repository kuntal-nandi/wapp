import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Bloc/play_music_bloc.dart';
import '../Data Provider/music_data.dart';

class PlaylistSongs extends StatefulWidget {
  const PlaylistSongs({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<PlaylistSongs> createState() => _PlaylistSongsState();
}

class _PlaylistSongsState extends State<PlaylistSongs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC9DFEC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  NeumorphicButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: const NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: 2,
                          lightSource: LightSource.bottom,
                          color: Color(0xffB0CFDE),
                          border: NeumorphicBorder(
                            isEnabled: true,
                            color: Color(0xffF0FFFF),
                            width: 2,
                          )),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 22,
                        color: Color(0xff686A6C),
                      )),
                  const SizedBox(
                    width: 90,
                  ),
                  NeumorphicText(
                    "Playlist Name",
                    style: const NeumorphicStyle(
                        depth: 4, //customize depth here
                        color: Color(0xff737CA1),
                        border: NeumorphicBorder(
                          isEnabled: true,
                          color: Color(0xff2B3856),
                          width: 0.8,
                        ) //customize color here
                        ),
                    textStyle: NeumorphicTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600 //customize size here
                        // AND others usual text style properties (fontFamily, fontWeight, ...)
                        ),
                  ),
                ],
              ),
            ),
            Text(
              MusicDataProvider.playLists[widget.index].playlistName
                  .toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            BlocBuilder<PlayMusicBloc, PlayMusicState>(
              builder: (context, state) {
                if (state is PlayMusicLoaded) {
                  return Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount:
                            state.playlists[widget.index].musicList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NeumorphicButton(
                            onPressed: () {

                            },
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8)),
                              // depth: 10,
                              lightSource: LightSource.topLeft,
                              color: const Color(0xff87CEEB),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.playlists[widget.index]
                                          .musicList[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff342D7E),
                                          fontSize: 22),
                                    ),
                                    Text(
                                      state.playlists[widget.index]
                                          .musicList[index].artist,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff3B3131),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                NeumorphicButton(
                                    onPressed: () {
                                      BlocProvider.of<PlayMusicBloc>(context)
                                          .add(DeleteMusicFromPlaylist(
                                              playlistIndex: widget.index,
                                              musicIndex: index));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(milliseconds: 600),
                                        content: Text('Music is deleted from Playlist'),
                                      ));
                                    },
                                    style: const NeumorphicStyle(
                                        shape: NeumorphicShape.concave,
                                        boxShape: NeumorphicBoxShape.circle(),
                                        depth: 2,
                                        lightSource: LightSource.bottom,
                                        color: Color(0xffB0CFDE),
                                        border: NeumorphicBorder(
                                          isEnabled: true,
                                          color: Color(0xffF0FFFF),
                                          width: 2,
                                        )),
                                    child: const Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Color(0xff954535),
                                    )),
                              ],
                            ),
                          );
                        }),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
