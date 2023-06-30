import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class audio_player extends StatefulWidget {
  const audio_player({super.key});

  @override
  State<audio_player> createState() => _audio_playerState();
}

class _audio_playerState extends State<audio_player> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  List music = ['olamide.mp3', 'qdot.mp3', 'rock.mp3', 'sample.mp3'];

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  void newDuration(int second) {
    Duration newDurations = Duration(seconds: second);
    audioPlayer.seek(newDurations);
  }

  int count = 0;

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'lib/audio/');
    final url = await player.load(music[count]);
    audioPlayer.setSourceUrl(url.path);
    //if (isPlaying != false) {
    //  audioPlayer.resume();
    //  }
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: ((value) {
                setState(() {
                  newDuration(value.toInt());
                });
              })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(position.toString().split('.')[0]),
              Text(duration.toString().split('.')[0])
            ],
          ),
          Container(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: music.length,
                itemBuilder: ((context, index) {
                  return ElevatedButton(
                      onPressed: (() {
                        count = index;
                        setAudio();
                        setState(() {
                          isPlaying = false;
                        });
                      }),
                      child: Text('play'));
                })),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: (() async {
                    setState(() {
                      count--;
                      if (count <= music.length) {
                        count = 0;
                      }
                      setAudio();
                      isPlaying = false;
                    });
                  }),
                  child: Text('prev')),
              ElevatedButton(
                  onPressed: (() async {
                    setState(() {
                      count++;
                      if (count >= music.length) {
                        count = 0;
                      }

                      setAudio();
                      isPlaying = false;
                      print(count);
                    });
                  }),
                  child: Text('next')),
              ElevatedButton.icon(
                label: Text('play'),
                onPressed: (() async {
                  if (isPlaying == false) {
                    await audioPlayer.resume();
                    setState(() {
                      isPlaying = true;
                    });
                  } else {
                    await audioPlayer.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  }
                }),
                icon: isPlaying == false
                    ? Icon(Icons.play_arrow)
                    : Icon(Icons.pause),
              )
            ],
          )
        ],
      ),
    );
  }
}
