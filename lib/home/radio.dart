import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../artistesdetails/profile.dart';
import '../bottomnavigationbar/bottomnavigationbar.dart';
import '../constants.dart';

class radio extends StatefulWidget {
  const radio({Key? key}) : super(key: key);

  @override
  State<radio> createState() => _RadioPageState();
}

class _RadioPageState extends State<radio> {
  // bool tapper = false;
  //
  // void toggleContainerVisibility() {
  //   setState(() {
  //     tapper = !tapper;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            builder: (context) => const profilePage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 71, 224, 76),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RadioSelector(
                      radioChanel: 'Jazz FM',
                      radioStation: '106.5',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'RayMax FM',
                      radioStation: '91.3',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
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
                      radioStation: '99.1',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'Max FM',
                      radioStation: '103.5',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
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
                      radioChanel: 'Wazobia FM',
                      radioStation: '107.9',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'Naija FM',
                      radioStation: '99.3',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
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
                      radioChanel: 'Classic FM',
                      radioStation: '97.3',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'Radio FM',
                      radioStation: '92.3',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
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
                      radioChanel: 'Beat FM',
                      radioStation: '92.9',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
                    ),
                    RadioSelector(
                      radioChanel: 'Love FM',
                      radioStation: '104.9',
                      // checker: tapper,
                      // onTap: toggleContainerVisibility,
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

class RadioSelector extends StatefulWidget {
  RadioSelector({
    required this.radioStation,
    required this.radioChanel,
  });

  final String radioStation;
  final String radioChanel;

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

  void toggleContainerVisibility() {
    setState(() {
      tapper = !tapper;
    });
  }

  void toggleHearts() {
    setState(() {
      hearts = !hearts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleContainerVisibility, // Call the provided onTap callback
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3.0,
            style: BorderStyle.solid,
            color: tapper ? Colors.green : Colors.white,
          ),
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
                height: 70,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
