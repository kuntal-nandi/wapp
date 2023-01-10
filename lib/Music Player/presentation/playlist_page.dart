
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:wapp/Music%20Player/Bloc/play_music_bloc.dart';
import 'package:wapp/Music%20Player/presentation/playlist_songs_page.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  final TextEditingController _controller = TextEditingController();
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
                    "Your Playlists",
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
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<PlayMusicBloc, PlayMusicState>(
              builder: (context, state) {
                if(state is PlayMusicLoaded){
                  return Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.playlists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlaylistSongs(
                                      index: index,
                                    )),
                              );
                            },
                            child: Neumorphic(
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
                                    children:  [
                                      Text(
                                        state.playlists[index].playlistName.toUpperCase(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff0C090A),
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                       Text(
                                        'Total Songs:${state.playlists[index].musicList.length}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff342D7E),
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  NeumorphicButton(
                                      onPressed: () {
                                        BlocProvider.of<PlayMusicBloc>(context).add(DeletePlaylist(playlistIndex: index));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          duration: Duration(milliseconds: 600),
                                          content: Text('PlayList is deleted'),
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
                            ),
                          );
                        }),
                  );
                }
                return Container();
              },
            ),
            NeumorphicButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    alignment: Alignment.center,
                    actions: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'PlayList Name',
                        ),
                        controller: _controller,
                      ),
                      Align(
                        child: NeumorphicButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty &&
                                _controller.text != '') {
                              BlocProvider.of<PlayMusicBloc>(ctx).add(
                                  AddPlaylist(playlistName: _controller.text));
                              ScaffoldMessenger.of(ctx)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 600),
                                content: Text('PlayList Added Successfully'),
                              ));
                            } else {
                              ScaffoldMessenger.of(ctx)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 600),
                                content: Text('PlayList name can not be empty'),
                              ));
                            }
                            _controller.clear();
                            Navigator.pop(ctx);
                          },
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(8)),
                            // depth: 10,
                            lightSource: LightSource.topLeft,
                            color: const Color(0xffDBF9DB),
                          ),
                          child: Text(
                            'Add Playlist',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff3B2F2F).withOpacity(0.9),
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                // depth: 10,
                lightSource: LightSource.topLeft,
                color: const Color(0xffF3E3C3),
              ),
              child: const Text(
                'Add New Playlist',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff3B2F2F),
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
