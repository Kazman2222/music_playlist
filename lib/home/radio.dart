import 'dart:math';

import 'package:audio_playlist/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';

import '../bottomnavigationbar/bottomnavigationbar.dart';

class radio extends StatefulWidget {
  const radio({Key? key}) : super(key: key);

  @override
  State<radio> createState() => _RadioPageState();
}

class _RadioPageState extends State<radio> {
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
                              child: const Text(
                                'J',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
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
                            radioChanel: 'Ugradio', radioStation: 'UG Station'
                            // checker: tapper,
                            // onTap: toggleContainerVisibility,
                            ),
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Center(
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)),
                      //         primary: Colors.grey.withOpacity(0.4)),
                      //     onPressed: () {},
                      //     // child: null,
                      //     child: SizedBox(
                      //       height: 55,
                      //       width: 42,
                      //       child: GestureDetector(
                      //         onTap: (() {
                      //           // print(player);
                      //           if (tappin == false) {
                      //             setState(() {
                      //               tappin = true;
                      //             });
                      //           } else {
                      //             setState(() {
                      //               tappin = false;
                      //             });
                      //           }
                      //         }),
                      //         child: tappin
                      //             ? Icon(
                      //                 Icons.play_circle,
                      //                 color: Colors.white,
                      //                 size: 42,
                      //               )
                      //             : Icon(
                      //                 Icons.pause_circle,
                      //                 color: Colors.white,
                      //                 size: 42,
                      //               ),
                      //       ),
                      //     ),
                      //   ),
                      // )
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
        onTap: () {
          setState(() {
            tapper = !tapper;
          });
          tapper ? radioPlayer.play(radioUrl) : radioPlayer.stop();
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
                Image.asset(
                  images[colorPicker()],
                  // height: 80.w,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class RadioPlayer {
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   Future<void> play(String url) async {
//     int result = await audioPlayer.play(url);
//     if (result == 1) {
//       // Success
//       print('Playing audio');
//     } else {
//       print('Error playing audio');
//     }
//   }
//
//   Future<void> stop() async {
//     await audioPlayer.stop();
//   }
// }

// class RadioPlayer {
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   Future<void> play(Source url) {
//     return audioPlayer.play(url);
//   }
//
//   Future<void> stop() {
//     return audioPlayer.stop();
//   }
// }

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
