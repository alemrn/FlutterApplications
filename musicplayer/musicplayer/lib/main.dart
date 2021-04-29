import 'package:flutter/material.dart';
import 'package:musicplayer/src/models/audioPlayer_model.dart';
import 'package:musicplayer/src/pages/music_player_page.dart';
import 'package:musicplayer/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new AudioPlayerModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music player',
        theme: miTema,
        home: MusicPlayerPage(),
      ),
    );
  }
}
