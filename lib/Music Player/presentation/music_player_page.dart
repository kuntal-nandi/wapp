import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wapp/Music%20Player/Bloc/play_music_bloc.dart';
import 'package:wapp/Music%20Player/Data%20Provider/music_data.dart';
import 'package:wapp/Music%20Player/presentation/playing_now_page.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    BlocProvider.of<PlayMusicBloc>(context).add(GetInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC9DFEC),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NeumorphicText(
              "All Songs",
              style: const NeumorphicStyle(
                  depth: 4, //customize depth here
                  color: Color(0xff737CA1),
                  border: NeumorphicBorder(
                    isEnabled: true,
                    color: Color(0x33000000),
                    width: 0.8,
                  ) //customize color here
                  ),
              textStyle: NeumorphicTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600 //customize size here
                  // AND others usual text style properties (fontFamily, fontWeight, ...)
                  ),
            ),
            const SizedBox(
              height: 60,
            ),
            BlocBuilder<PlayMusicBloc, PlayMusicState>(
              builder: (context, state) {
                if (state is PlayMusicInitial) {
                  return Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NeumorphicButton(
                                onPressed: () {
                                  BlocProvider.of<PlayMusicBloc>(context).add(
                                      ChangeFavourite(
                                          musicModel:
                                              MusicDataProvider.selectedMusic));
                                },
                                style: const NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: Color(0xffB0CFDE),
                                    border: NeumorphicBorder(
                                      isEnabled: true,
                                      color: Color(0xffF0FFFF),
                                      width: 2,
                                    )),
                                child: Icon(
                                  Icons.favorite,
                                  size: 22,
                                  color: MusicDataProvider
                                              .selectedMusic.isFavourite ==
                                          true
                                      ? const Color(0xff000080)
                                      : const Color(0xff566D7E)
                                          .withOpacity(0.4),
                                )),
                            Neumorphic(
                              style: const NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 10,
                                  intensity: 1,
                                  lightSource: LightSource.topLeft,
                                  color: Color(0xffB0CFDE),
                                  border: NeumorphicBorder(
                                    isEnabled: true,
                                    color: Color(0xffBCC6CC),
                                    width: 8,
                                  )),
                              child: Image.network(
                                MusicDataProvider.selectedMusic.image,
                                height: 180,
                              ),
                            ),
                            NeumorphicButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const SizedBox(
                                        height: 100,
                                        child:  Padding(
                                          padding:  EdgeInsets.all(16.0),
                                          child:  Text('No Play Lists Added',style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey
                                          ),),
                                        ),
                                      );
                                    });
                              },
                              style: const NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 8,
                                  lightSource: LightSource.topLeft,
                                  color: Color(0xffB0CFDE),
                                  border: NeumorphicBorder(
                                    isEnabled: true,
                                    color: Color(0xffF0FFFF),
                                    width: 2,
                                  )),
                              child: NeumorphicIcon(
                                Icons.add,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: MusicDataProvider.allMusicList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return index == MusicDataProvider.selectedIndex
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PlayingNow()),
                                          );
                                        },
                                        child: Neumorphic(
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          style: NeumorphicStyle(
                                            shape: NeumorphicShape.concave,
                                            boxShape:
                                                NeumorphicBoxShape.roundRect(
                                                    BorderRadius.circular(12)),
                                            // depth: 10,
                                            lightSource: LightSource.topLeft,
                                            color: const Color(0xff4169E1)
                                                .withOpacity(0.2),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    MusicDataProvider
                                                        .allMusicList[index]
                                                        .name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff0C090A),
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    MusicDataProvider
                                                        .allMusicList[index]
                                                        .artist,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff737CA1),
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              MusicDataProvider.selectedMusic
                                                          .isPlaying ==
                                                      true
                                                  ? NeumorphicButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    PlayMusicBloc>(
                                                                context)
                                                            .add(PlayPause(
                                                                musicModel:
                                                                    MusicDataProvider
                                                                            .allMusicList[
                                                                        index]));
                                                      },
                                                      style:
                                                          const NeumorphicStyle(
                                                              shape:
                                                                  NeumorphicShape
                                                                      .convex,
                                                              boxShape:
                                                                  NeumorphicBoxShape
                                                                      .circle(),
                                                              depth: 8,
                                                              lightSource:
                                                                  LightSource
                                                                      .topLeft,
                                                              color: Color(
                                                                  0xff2B65EC),
                                                              border:
                                                                  NeumorphicBorder(
                                                                isEnabled: true,
                                                                color: Color(
                                                                    0xffF0FFFF),
                                                                width: 2,
                                                              )),
                                                      child: NeumorphicIcon(
                                                        Icons.pause,
                                                        size: 20,
                                                      ),
                                                    )
                                                  : NeumorphicButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    PlayMusicBloc>(
                                                                context)
                                                            .add(PlayPause(
                                                                musicModel:
                                                                    MusicDataProvider
                                                                            .allMusicList[
                                                                        index]));
                                                      },
                                                      style:
                                                          const NeumorphicStyle(
                                                              shape:
                                                                  NeumorphicShape
                                                                      .convex,
                                                              boxShape:
                                                                  NeumorphicBoxShape
                                                                      .circle(),
                                                              depth: 8,
                                                              lightSource:
                                                                  LightSource
                                                                      .topLeft,
                                                              color: Color(
                                                                  0xffC2DFFF),
                                                              border:
                                                                  NeumorphicBorder(
                                                                isEnabled: true,
                                                                color: Color(
                                                                    0xffF0FFFF),
                                                                width: 2,
                                                              )),
                                                      child: NeumorphicIcon(
                                                        Icons.play_arrow,
                                                        size: 20,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          BlocProvider.of<PlayMusicBloc>(
                                                  context)
                                              .add(ChangeMusic(
                                                  selectedMusicIndex: index));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PlayingNow()),
                                          );
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.only(
                                                left: 6, right: 6),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      MusicDataProvider
                                                          .allMusicList[index]
                                                          .name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xff0C090A),
                                                          fontSize: 14),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      MusicDataProvider
                                                          .allMusicList[index]
                                                          .artist,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xff737CA1),
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                NeumorphicButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                PlayMusicBloc>(
                                                            context)
                                                        .add(ChangeMusic(
                                                            selectedMusicIndex:
                                                                index));
                                                  },
                                                  style: const NeumorphicStyle(
                                                      shape: NeumorphicShape
                                                          .convex,
                                                      boxShape:
                                                          NeumorphicBoxShape
                                                              .circle(),
                                                      depth: 8,
                                                      lightSource:
                                                          LightSource.topLeft,
                                                      color: Color(0xffC2DFFF),
                                                      border: NeumorphicBorder(
                                                        isEnabled: true,
                                                        color:
                                                            Color(0xffF0FFFF),
                                                        width: 2,
                                                      )),
                                                  child: NeumorphicIcon(
                                                    Icons.play_arrow,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                              }),
                        ),
                      ],
                    ),
                  );
                } else if (state is PlayMusicLoaded) {
                  return Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NeumorphicButton(
                                onPressed: () {
                                  BlocProvider.of<PlayMusicBloc>(context).add(
                                      ChangeFavourite(
                                          musicModel: state.selectedMusic));
                                },
                                style: const NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: Color(0xffB0CFDE),
                                    border: NeumorphicBorder(
                                      isEnabled: true,
                                      color: Color(0xffF0FFFF),
                                      width: 2,
                                    )),
                                child: Icon(
                                  Icons.favorite,
                                  size: 22,
                                  color: state.selectedMusic.isFavourite == true
                                      ? const Color(0xff000080)
                                      : const Color(0xff566D7E)
                                          .withOpacity(0.4),
                                )),
                            Neumorphic(
                              style: const NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 10,
                                  intensity: 1,
                                  lightSource: LightSource.topLeft,
                                  color: Color(0xffB0CFDE),
                                  border: NeumorphicBorder(
                                    isEnabled: true,
                                    color: Color(0xffBCC6CC),
                                    width: 8,
                                  )),
                              child: Image.network(
                                MusicDataProvider.selectedMusic.image,
                                height: 180,
                              ),
                            ),
                            NeumorphicButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            const Text('Play Lists',style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.deepPurple
                                            ),),
                                            Expanded(
                                              child: ListView(
                                                children: [
                                                  for (int i = 0;
                                                  i <
                                                      state
                                                          .playlists.length;
                                                  i++)
                                                    NeumorphicButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                          BlocProvider.of<
                                                              PlayMusicBloc>(
                                                              context)
                                                              .add(AddMusicOnPlaylist(
                                                              playlistIndex:
                                                              i,
                                                              musicModel: state
                                                                  .selectedMusic));
                                                          ScaffoldMessenger.of(context)
                                                              .showSnackBar(const SnackBar(
                                                            duration: Duration(milliseconds: 600),
                                                            content: Text('Music is Added to Playlist'),
                                                          ));
                                                        },
                                                        padding:
                                                        const EdgeInsets
                                                            .all(10),
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 10,
                                                            bottom: 10),
                                                        style: NeumorphicStyle(
                                                          shape: NeumorphicShape
                                                              .concave,
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                              BorderRadius
                                                                  .circular(
                                                                  8)),
                                                          // depth: 10,
                                                          lightSource:
                                                          LightSource
                                                              .topLeft,
                                                          color: const Color(
                                                              0xffF3E3C3),
                                                        ),
                                                        child: Text(
                                                          state.playlists[i]
                                                              .playlistName
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              color: Color(
                                                                  0xff3B2F2F),
                                                              fontSize: 14),
                                                        ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              style: const NeumorphicStyle(
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 8,
                                  lightSource: LightSource.topLeft,
                                  color: Color(0xffB0CFDE),
                                  border: NeumorphicBorder(
                                    isEnabled: true,
                                    color: Color(0xffF0FFFF),
                                    width: 2,
                                  )),
                              child: NeumorphicIcon(
                                Icons.add,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.allMusic.length,
                              itemBuilder: (BuildContext context, int index) {
                                return index == state.selectedMusicIndex
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PlayingNow()),
                                          );
                                        },
                                        child: Neumorphic(
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          style: NeumorphicStyle(
                                            shape: NeumorphicShape.concave,
                                            boxShape:
                                                NeumorphicBoxShape.roundRect(
                                                    BorderRadius.circular(12)),
                                            // depth: 10,
                                            lightSource: LightSource.topLeft,
                                            color: const Color(0xff4169E1)
                                                .withOpacity(0.2),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.allMusic[index].name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff0C090A),
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    state
                                                        .allMusic[index].artist,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            Color(0xff737CA1),
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              state.selectedMusic.isPlaying ==
                                                      true
                                                  ? NeumorphicButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    PlayMusicBloc>(
                                                                context)
                                                            .add(PlayPause(
                                                                musicModel: state
                                                                        .allMusic[
                                                                    index]));
                                                      },
                                                      style:
                                                          const NeumorphicStyle(
                                                              shape:
                                                                  NeumorphicShape
                                                                      .convex,
                                                              boxShape:
                                                                  NeumorphicBoxShape
                                                                      .circle(),
                                                              depth: 8,
                                                              lightSource:
                                                                  LightSource
                                                                      .topLeft,
                                                              color: Color(
                                                                  0xff2B65EC),
                                                              border:
                                                                  NeumorphicBorder(
                                                                isEnabled: true,
                                                                color: Color(
                                                                    0xffF0FFFF),
                                                                width: 2,
                                                              )),
                                                      child: NeumorphicIcon(
                                                        Icons.pause,
                                                        size: 20,
                                                      ),
                                                    )
                                                  : NeumorphicButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    PlayMusicBloc>(
                                                                context)
                                                            .add(PlayPause(
                                                                musicModel: state
                                                                        .allMusic[
                                                                    index]));
                                                      },
                                                      style:
                                                          const NeumorphicStyle(
                                                              shape:
                                                                  NeumorphicShape
                                                                      .convex,
                                                              boxShape:
                                                                  NeumorphicBoxShape
                                                                      .circle(),
                                                              depth: 8,
                                                              lightSource:
                                                                  LightSource
                                                                      .topLeft,
                                                              color: Color(
                                                                  0xffC2DFFF),
                                                              border:
                                                                  NeumorphicBorder(
                                                                isEnabled: true,
                                                                color: Color(
                                                                    0xffF0FFFF),
                                                                width: 2,
                                                              )),
                                                      child: NeumorphicIcon(
                                                        Icons.play_arrow,
                                                        size: 20,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          BlocProvider.of<PlayMusicBloc>(
                                                  context)
                                              .add(ChangeMusic(
                                                  selectedMusicIndex: index));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PlayingNow()),
                                          );
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            padding: const EdgeInsets.only(
                                                left: 6, right: 6),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state
                                                          .allMusic[index].name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xff0C090A),
                                                          fontSize: 14),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      state.allMusic[index]
                                                          .artist,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Color(0xff737CA1),
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                                NeumorphicButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                PlayMusicBloc>(
                                                            context)
                                                        .add(ChangeMusic(
                                                            selectedMusicIndex:
                                                                index));
                                                  },
                                                  style: const NeumorphicStyle(
                                                      shape: NeumorphicShape
                                                          .convex,
                                                      boxShape:
                                                          NeumorphicBoxShape
                                                              .circle(),
                                                      depth: 8,
                                                      lightSource:
                                                          LightSource.topLeft,
                                                      color: Color(0xffC2DFFF),
                                                      border: NeumorphicBorder(
                                                        isEnabled: true,
                                                        color:
                                                            Color(0xffF0FFFF),
                                                        width: 2,
                                                      )),
                                                  child: NeumorphicIcon(
                                                    Icons.play_arrow,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                              }),
                        ),
                      ],
                    ),
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
