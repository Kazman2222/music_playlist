import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../artistesdetails/profile.dart';
import '../bottomnavigationbar/bottomnavigationbar.dart';
import '../constants.dart';

class radio extends StatefulWidget {
  const radio({super.key});

  @override
  State<radio> createState() => _radioState();
}

// Random random = Random();
//
// // Generate a random integer within a range
// int randomNumber =
//     random.nextInt(5); // Generates a random number between 0 and 99
//
// // print(randomNumber) {
// //   // TODO: implement print
// //   throw UnimplementedError();
// // }

class _radioState extends State<radio> {
  // String image_1 = 'assets/pics/radio_hz1.png';
  // String image_2 = 'assets/pics/radio_hz2.png';
  // String image_3 = 'assets/pics/radio_hz3.png';
  // String image_4 = 'assets/pics/radio_hz4.png';

  // List<String> images = [
  //   'assets/pics/radio_hz1.png',
  //   'assets/pics/radio_hz2.png',
  //   'assets/pics/radio_hz3.png',
  //   'assets/pics/radio_hz3.png'
  // ];

  // Random random = Random();
  //
  // // Generate a random integer within a range
  // int randomNumber = random.nextInt(5); // Generates a random number between 0 and 99
  //
  // print(randomNumber);

  // print();

  // int colorPicker() {
  //   Random random = Random();
  //
  //   int randomNumber = random.nextInt(5); // Generate a random whole number between 0 and 99
  //
  //   return randomNumber;
  // }

  @override
  Widget build(BuildContext context) {
    bool tapper = false;

    bool toggleContainerVisibility() {
      setState(() {
        tapper = !tapper;
      });
      return tapper;
    }

    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const profilePage()),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 71, 224, 76),
                              radius: 20.r,
                              child: const Text('J',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('Radio',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                    ],
                  ),
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
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.black),
                      onPressed: (() {}),
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
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.green),
                      onPressed: (() {}),
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
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.black),
                      onPressed: (() {}),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RadioSelector(
                      radioChanel: 'Jazz FM',
                      radioStation: '106.5',
                      checker: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'RayMax FM',
                      radioStation: '91.3',
                      checker: toggleContainerVisibility,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RadioSelector(
                      radioChanel: 'Cool FM',
                      radioStation: '99.6',
                      checker: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'Max FM',
                      radioStation: '103.5',
                      checker: toggleContainerVisibility,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const bottom(),
    );
  }
}

class RadioSelector extends StatelessWidget {
  // const RadioSelector({
  //   Key? key,
  // }) : super(key: key);

  int colorPicker() {
    Random random = Random();

    int randomNumber =
        random.nextInt(4); // Generate a random whole number between 0 and 99

    return randomNumber;
  }

  RadioSelector(
      {required this.radioStation,
      required this.radioChanel,
      required this.checker});

  late String radioStation;
  late String radioChanel;
  late bool Function() checker;

  List<String> images = [
    'assets/pics/radio_hz1.png',
    'assets/pics/radio_hz2.png',
    'assets/pics/radio_hz3.png',
    'assets/pics/radio_hz4.png'
  ];

  // bool condition = checker as bool;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: checker,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 3.0,
              style: BorderStyle.solid,
              color: checker ? Colors.green : Colors.white),
        ),
        height: 250,
        width: 170,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        radioStation,
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
                        radioChanel,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_outline,
                      color: Colors.green,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Image.asset(
                images[colorPicker()],
                height: 70,
                width: double.infinity,
                // alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Slider(
// activeColor: Colors.white,
// min: 0.0,
// max: 100.0,
// value: 20,
// onChanged: ((value) {})),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: const [
// Text(
// '15:25',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold),
// ),
// Text('27:30',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold))
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: const [
// Icon(Icons.loop_outlined,
// color: Color.fromARGB(255, 244, 242, 242),
// size: 28),
// Icon(Icons.skip_previous_outlined,
// color: Colors.white, size: 28),
// Icon(
// Icons.play_circle,
// color: Colors.white,
// size: 28,
// ),
// Icon(Icons.skip_next_outlined,
// color: Colors.white, size: 28),
// Icon(Icons.volume_up_outlined,
// color: Colors.white, size: 28),
