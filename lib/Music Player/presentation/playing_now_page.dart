import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wapp/Music%20Player/Bloc/play_music_bloc.dart';
import 'package:wapp/Music%20Player/presentation/playlist_page.dart';

import '../Data Provider/music_data.dart';

class PlayingNow extends StatefulWidget {
  const PlayingNow({Key? key}) : super(key: key);

  @override
  State<PlayingNow> createState() => _PlayingNowState();
}

class _PlayingNowState extends State<PlayingNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC9DFEC),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NeumorphicButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 22,
                      color: Color(0xff686A6C),
                    )),
                NeumorphicText(
                  "Playing Now",
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
                      fontSize: 14,
                      fontWeight: FontWeight.w600 //customize size here
                      // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                ),
                NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayListPage()),
                      );
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
                    child: const Icon(
                      Icons.menu,
                      size: 22,
                      // color: Color(0xff566D7E).withOpacity(0.4),
                      // color: Color(0xff000080),
                      color: Color(0xff686A6C),
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<PlayMusicBloc, PlayMusicState>(
              builder: (context, state) {
                if(state is PlayMusicInitial){
                  return Column(
                    children: [
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
                              color: Color(0xffC9DFEF),
                              width: 10,
                            )),
                        child: Image.network(
                          MusicDataProvider.selectedMusic.image,
                          height: 240,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        MusicDataProvider.selectedMusic.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0C090A),
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        MusicDataProvider.selectedMusic.artist,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff737CA1),
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '0.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff737CA1),
                                  fontSize: 12),
                            ),
                            Text(
                              MusicDataProvider.selectedMusic.duration.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff737CA1),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      NeumorphicSlider(
                        min: 0.0,
                        max: MusicDataProvider.selectedMusic.duration,
                        value: 0.8,
                        height: 8,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayPrevious());
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
                              Icons.skip_previous,
                              size: 34,
                            ),
                          ),
                           MusicDataProvider.selectedMusic.isPlaying == true
                               ? NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayPause(musicModel: MusicDataProvider.selectedMusic));
                            },
                            style: const NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Color(0xff2B65EC),
                                border: NeumorphicBorder(
                                  isEnabled: true,
                                  color: Color(0xffF0FFFF),
                                  width: 2,
                                )),
                            child: NeumorphicIcon(
                              Icons.pause,
                              size: 38,
                            ),
                          )
                           : NeumorphicButton(
                             onPressed: () {
                               BlocProvider.of<PlayMusicBloc>(context).add(PlayPause(musicModel: MusicDataProvider.selectedMusic));
                             },
                             style: const NeumorphicStyle(
                                 shape: NeumorphicShape.convex,
                                 boxShape: NeumorphicBoxShape.circle(),
                                 depth: 8,
                                 lightSource: LightSource.topLeft,
                                 color: Color(0xffC2DFFF),
                                 border: NeumorphicBorder(
                                   isEnabled: true,
                                   color: Color(0xffF0FFFF),
                                   width: 2,
                                 )),
                             child: NeumorphicIcon(
                               Icons.play_arrow,
                               size: 38,
                             ),
                           ),
                          NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayNext());
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
                              Icons.skip_next,
                              size: 34,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                            size: 40,
                            color: MusicDataProvider
                                .selectedMusic.isFavourite ==
                                true
                                ? const Color(0xff000080)
                                : const Color(0xff566D7E)
                                .withOpacity(0.4),
                          )),
                    ],
                  );
                }
                else if(state is PlayMusicLoaded){
                  return Column(
                    children: [
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
                              color: Color(0xffC9DFEF),
                              width: 10,
                            )),
                        child: Image.network(
                          MusicDataProvider.selectedMusic.image,
                          height: 240,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        state.selectedMusic.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff0C090A),
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.selectedMusic.artist,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff737CA1),
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '0.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff737CA1),
                                  fontSize: 12),
                            ),
                            Text(
                              state.selectedMusic.duration.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff737CA1),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      NeumorphicSlider(
                        min: 0.0,
                        max: state.selectedMusic.duration,
                        value: 0.8,
                        height: 8,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayPrevious());
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
                              Icons.skip_previous,
                              size: 34,
                            ),
                          ),
                          state.selectedMusic.isPlaying == true
                              ? NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayPause(musicModel: state.selectedMusic));
                            },
                            style: const NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Color(0xff2B65EC),
                                border: NeumorphicBorder(
                                  isEnabled: true,
                                  color: Color(0xffF0FFFF),
                                  width: 2,
                                )),
                            child: NeumorphicIcon(
                              Icons.pause,
                              size: 38,
                            ),
                          )
                              : NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayPause(musicModel: state.selectedMusic));
                            },
                            style: const NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Color(0xffC2DFFF),
                                border: NeumorphicBorder(
                                  isEnabled: true,
                                  color: Color(0xffF0FFFF),
                                  width: 2,
                                )),
                            child: NeumorphicIcon(
                              Icons.play_arrow,
                              size: 38,
                            ),
                          ),
                          NeumorphicButton(
                            onPressed: () {
                              BlocProvider.of<PlayMusicBloc>(context).add(PlayNext());
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
                              Icons.skip_next,
                              size: 34,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      NeumorphicButton(
                          onPressed: () {
                            BlocProvider.of<PlayMusicBloc>(context).add(
                                ChangeFavourite(
                                    musicModel:
                                    state.selectedMusic));
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
                            size: 40,
                            color: state
                                .selectedMusic.isFavourite ==
                                true
                                ? const Color(0xff000080)
                                : const Color(0xff566D7E)
                                .withOpacity(0.4),
                          )),
                    ],
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
