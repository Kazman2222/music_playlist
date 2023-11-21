import 'dart:math';

import 'package:audio_playlist/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

import '../bottomnavigationbar/bottomnavigationbar.dart';

class radio extends StatefulWidget {
  const radio({Key? key}) : super(key: key);

  @override
  State<radio> createState() => _RadioPageState();
}

class _RadioPageState extends State<radio> {
  final usero = FirebaseAuth.instance.currentUser!;
  // bool tappin = false;
  //
  // void toggleContainerVisibility() {
  //   setState(() {
  //     tapper = !tapper;
  //   });
  // }

  // final String radioUrl =
  //     'https://live.ugradio.online:8000/radio.mp3'; // Replace with the actual URL
  //
  // final RadioPlayer radioPlayer = RadioPlayer();

  // ElevatedButton(
  // onPressed: () => radioPlayer.play(radioUrl),
  // child: Text('Play'),
  // ),
  // ElevatedButton(
  // onPressed: () => radioPlayer.stop(),
  // child: Text('Stop'),
  // ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 71, 224, 76),
                              radius: 20.r,
                              child: Text(usero.email![0].toUpperCase(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            'Radio',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.black,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'All',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.green,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Favorite',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.black,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: RadioSelector(
                            radioChanel: 'UG Station', radioStation: 'Ugradio'
                            // checker: tapper,
                            // onTap: toggleContainerVisibility,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioSelector extends StatefulWidget {
  RadioSelector({
    required this.radioStation,
    required this.radioChanel,
    // required this.p2p
  });

  final String radioStation;
  final String radioChanel;
  // late bool p2p;

  @override
  State<RadioSelector> createState() => _RadioSelectorState();
}

class _RadioSelectorState extends State<RadioSelector> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/ugradio-a3901.appspot.com/o/appdetails%2Fradiovid.mp4?alt=media&token=aed8a54b-02ff-4886-96de-c2085ad8e460') // Adjust the asset path
      ..initialize().then((_) {
        setState(() {});
        // _controller.play();
        // _controller.setLooping(true);
      });
  }

  int colorPicker() {
    Random random = Random();
    int randomNumber =
        random.nextInt(4); // Generate a random number between 0 and 3
    return randomNumber;
  }

  List<String> images = [
    'assets/pics/radio_hz1.png',
    'assets/pics/radio_hz2.png',
    'assets/pics/radio_hz3.png',
    'assets/pics/radio_hz4.png'
  ];

  bool tapper = false;
  bool hearts = false;

  // void toggleContainerVisibility() {
  //   setState(() {
  //     tapper = !tapper;
  //   });
  // }

  void toggleHearts() {
    setState(() {
      hearts = !hearts;
    });
  }

  final String radioUrl =
      'https://live.ugradio.online:8000/radio.mp3'; // Replace with the actual URL

  final RadioPlayer radioPlayer = RadioPlayer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () async {
          setState(() {
            tapper = !tapper;
          });
          if (tapper) {
            await radioPlayer.play(radioUrl);
            _controller.play();
            _controller.setLooping(true);
          } else {
            radioPlayer.stop();
            _controller.pause();
          }
        }, // Call the provided onTap callback
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 3.0,
              style: BorderStyle.solid,
              color: tapper ? Colors.green : Colors.white,
            ),
          ),
          // height: 250,
          // width: 170,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.radioStation,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.radioChanel,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: toggleHearts,
                      child: Icon(
                        hearts ? Icons.favorite : Icons.favorite_outline_sharp,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                _controller.value.isInitialized
                    ? Expanded(
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Expanded(
                        child: Image.asset(
                          images[colorPicker()],
                          // height: 80.w,
                          width: double.infinity,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    radioPlayer.stop();
    _controller.dispose();
    super.dispose();
  }
}

class RadioPlayer {
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> play(String url) async {
    await audioPlayer.setSourceUrl(url);
    await audioPlayer.resume();
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }
}
