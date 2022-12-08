import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioTile extends StatefulWidget {
  const AudioTile(
      {super.key,
      required this.containerColor,
      required this.trackColor,
      required this.widthSlider});

  final Color containerColor;
  final Color trackColor;
  final double widthSlider;

  @override
  State<AudioTile> createState() => _AudioTileState();
}

class _AudioTileState extends State<AudioTile> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    // return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(10, '0');
    return '${(Duration(seconds: seconds))}'.split('.')[0].split(':')[1] +
        ':' +
        '${(Duration(seconds: seconds))}'.split('.')[0].split(':')[2];
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    player.setSourceAsset('sounds/theme_01.mp3');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.stop();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.only(right: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Color(0xfff9f9f9),
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              iconSize: 30,
              color: Color(0xff009DBF),
              onPressed: () {
                print('Tapped Audio');
                if (isPlaying) {
                  player.pause();
                } else {
                  // player.play(AssetSource('sounds/theme_01.mp3'));
                  player.resume();
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            // width: MediaQuery.of(context).size.width - 160,
            width: widget.widthSlider,
            child: SliderTheme(
              data: SliderThemeData(
                inactiveTrackColor: widget.trackColor,
                thumbShape: SliderComponentShape.noThumb,
                trackHeight: 6,
              ),
              child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) {
                  final position = Duration(seconds: value.toInt());
                  player.seek(position);
                  player.resume();
                },
              ),
            ),
          ),
          Text(
            formatTime((duration - position).inSeconds),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   backgroundColor: Colors.white,
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           // margin: EdgeInsets.symmetric(horizontal: 50),
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Color(0xfff9f9f9),
    //             // color: Colors.yellow,
    //             borderRadius: BorderRadius.circular(16),
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               SizedBox(
    //                 width: 24,
    //                 child: IconButton(
    //                   icon: Icon(
    //                     isPlaying ? Icons.pause : Icons.play_arrow,
    //                   ),
    //                   color: Color(0xff009DBF),
    //                   onPressed: () {
    //                     if (isPlaying) {
    //                       player.pause();
    //                     } else {
    //                       player
    //                           .play(AssetSource('assets/sounds/theme_01.mp3'));
    //                     }
    //                   },
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width - 60,
    //                 child: SliderTheme(
    //                   data: SliderThemeData(
    //                     inactiveTrackColor: Colors.white,
    //                     thumbShape: SliderComponentShape.noThumb,
    //                   ),
    //                   child: Slider(
    //                     min: 0,
    //                     max: duration.inSeconds.toDouble(),
    //                     value: position.inSeconds.toDouble(),
    //                     onChanged: (value) {
    //                       final position = Duration(seconds: value.toInt());
    //                       player.seek(position);
    //                       player.resume();
    //                     },
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 formatTime((duration - position).inSeconds),
    //                 style: TextStyle(
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
