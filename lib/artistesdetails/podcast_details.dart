import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audio_playlist/constants.dart';
import 'package:audioplayers/audioplayers.dart';

import '../components/buttons.dart';
import '../constants.dart';

class Podcast extends StatefulWidget {
  final String title;
  final String host;
  final String description;
  final String Eptitle;
  final String EpDescription;
  final String release;
  final String? audio;
  final String? coverphoto;

  const Podcast({
    Key? key,
    required this.title,
    required this.host,
    required this.description,
    required this.Eptitle,
    required this.EpDescription,
    required this.release,
    this.audio,
    this.coverphoto,
  }) : super(key: key);

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  // String description =
  //     "Join child psychologist and mother of five Samantha Lee each Thursday morning as she interviews regular moms with their child behavioral issues.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar: buildAppBars(
          text: 'Podcast Details', onTap: () => Navigator.pop(context)),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      // 'https://cdn.asp.events/CLIENT_AV_Media_E63B4142_BA46_1D2B_9F2E146485599B42/sites/Podcast-Show-2022/media/TPS%203%20(1).jpeg'
                      image: NetworkImage(widget.coverphoto == null
                          ? 'https://media.istockphoto.com/id/1420789680/vector/girl-in-headphones-speaks-into-the-microphone-recording-podcast-in-studio-radio-broadcasting.jpg?s=612x612&w=0&k=20&c=DyUAJFWEBaaTmkhDHJkq4maVoqim1H76ZBQC3zHmN14='
                          : widget.coverphoto.toString()),
                      fit: BoxFit.cover),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      widget.host,
                      style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Podcast By: ${widget.title}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 27.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Total Eps",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 27.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 27.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Streams",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Colors.black),
                          onPressed: (() {}),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              "assets/favicons/upload_icon.svg",
                              height: 45.h,
                              width: 45.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65.h,
                          width: 180.w,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Colors.green),
                            onPressed: (() {}),
                            icon: Icon(
                              Icons.person_add_alt_outlined,
                              color: Colors.black,
                              size: 35.sp,
                            ),
                            label: Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Colors.black),
                          onPressed: (() {}),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              "assets/favicons/plus_add_icon.svg",
                              height: 45.h,
                              width: 45.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'All Episode',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Column(
                      children: [
                        podcastInfo(widget.coverphoto.toString(),
                            widget.Eptitle, widget.EpDescription, widget.audio),
                        // podcastInfo(
                        //     widget.coverphoto.toString(),
                        //     widget.Eptitle,
                        //     widget.EpDescription,
                        //     handlePlayer()),
                        // podcastInfo(
                        //     widget.coverphoto.toString(),
                        //     widget.Eptitle,
                        //     widget.EpDescription,
                        //     handlePlayer()),
                        // podcastInfo(
                        //     widget.coverphoto.toString(),
                        //     widget.Eptitle,
                        //     widget.EpDescription,
                        //     handlePlayer()),
                        // podcastInfo(
                        //     widget.coverphoto.toString(),
                        //     widget.Eptitle,
                        //     widget.EpDescription,
                        //     handlePlayer()),
                        // podcastInfo(
                        //     widget.coverphoto.toString(),
                        //     widget.Eptitle,
                        //     widget.EpDescription,
                        //     handlePlayer())
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget podcastInfo(
    String? coverPhoto, String? Eptitle, String? EpDescription, String? audio) {
  return Column(
    children: [
      builderPadding(),
      SizedBox(
        height: 10.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    coverPhoto == null
                        ? 'https://media.istockphoto.com/id/1420789680/vector/girl-in-headphones-speaks-into-the-microphone-recording-podcast-in-studio-radio-broadcasting.jpg?s=612x612&w=0&k=20&c=DyUAJFWEBaaTmkhDHJkq4maVoqim1H76ZBQC3zHmN14='
                        : coverPhoto.toString(),
                  ),
                  fit: BoxFit.cover),
              // color: Colors.white
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  EpDescription!,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Episode: ${Eptitle!}',
                  // softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'May 18 | 1hr 30min',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45.h,
            width: 45.w,
            child: play(audio: audio),
          ),
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}

class play extends StatefulWidget {
  final String? audio;
  const play({
    Key? key,
    this.audio,
  }) : super(key: key);

  @override
  State<play> createState() => _playState();
}

class _playState extends State<play> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  late String? theaudio = widget.audio;

  // late List music = [theaudio];

  @override
  void initState() {
    super.initState();
    // setAudio();
    // audioPlayer.onPlayerStateChanged.listen((event) {
    //   setState(() {
    //     isPlaying = event == PlayerState.playing;
    //   });
    // });

    audioPlayer.onPlayerComplete.listen((event) async {
      setState(() {
        isPlaying = false;
      });

      // isPlaying = false;
      // await audioPlayer.resume();
    });
    //
    // VolumeController().listener((volume) {
    //   setState(() => _volumeListenerValue = volume);
    // });
    //
    // VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  // final String? radioUrl =
  //     theaudio;

  // int count = 0;

  // Future setAudio() async {
  //   // Set the audio URL
  //   await audioPlayer.setSourceUrl(music[count]);
  // }

  Future<void> playing(String url) async {
    await audioPlayer.setSourceUrl(url);
    await audioPlayer.resume();
  }

  Future<void> stop() async {
    await audioPlayer.pause();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          primary: Colors.green,
          padding: const EdgeInsets.all(0.00),
        ),
        onPressed: (() async {
          setState(() {
            isPlaying = !isPlaying;
          });
          if (isPlaying) {
            await playing(theaudio!);
          } else {
            stop();
          }
        }),
        child: isPlaying
            ? Icon(
                Icons.pause,
                color: Colors.black,
                size: 40.sp,
              )
            : Icon(
                Icons.play_arrow_rounded,
                color: Colors.black,
                size: 40.sp,
              ));
  }
}
