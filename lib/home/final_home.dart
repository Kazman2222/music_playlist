import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/constants.dart';
import 'package:audio_playlist/state_management/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../adminPanel/admin_panel.dart';
import '../artistesdetails/podcast_details.dart';
import '../artistesdetails/profile.dart';
import '../popUps/audiencefeeds.dart';
import '../popUps/premiumPop.dart';

class final_home extends StatefulWidget {
  const final_home({super.key});

  @override
  
  State<final_home> createState() => _final_homeState();
  
}

class _final_homeState extends State<final_home> {
   // final usero = FirebaseAuth.instance.currentUser!;
 
  TextEditingController searchController = TextEditingController();

  List<String> myList = [];

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myList = (prefs.getStringList('counter') ?? []);
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      addToSearch();
      prefs.setStringList('counter', myList);
    });
  }

  void addToSearch() {
    setState(() {
      if (searchController.text != "") {
        myList.add(searchController.text);
      }
    });
  }

  void removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('counter');
      loadCounter();
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  @override
   
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff212121),
              kBackGroundColour,
            ],
          ),
        ),
        child: Consumer<AudioManagement>(builder: ((context, value, child) {
          
          return SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              child:  Text(
                                'J',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black)),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.notifications_active,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PremiumSub()),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const adminPanel()),
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text('Listen To Your  ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Favorite Podcast',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        // height: 45,
                        child: TextField(
                          onSubmitted: (value) {},
                          textAlign: TextAlign.start,
                          controller: searchController,
                          decoration: kTextFieldDecoration.copyWith(
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: const Color(0xff535353),
                            hintText: 'What do you want to listen to...',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Recent search',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          IconButton(
                              onPressed: (() {
                                setState(() {
                                  removeCounter();
                                });
                              }),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.green,
                              ))
                        ],
                      ),
                    ),
                    Visibility(
                      visible: myList.isEmpty ? false : true,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        height: 45.h,
                        child: Visibility(
                          visible: myList.isEmpty ? false : true,
                          child: Container(
                            height: 0,
                            width: 200.w,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: myList.length,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        searchController.text = myList[index];
                                      });
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(myList[index],
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          IconButton(
                                              onPressed: (() async {
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                setState(() {
                                                  myList.remove(myList[index]);
                                                  prefs.setStringList(
                                                      'counter', myList);
                                                });
                                              }),
                                              icon: const Icon(
                                                Icons.close,
                                                color: Color.fromARGB(
                                                    255, 71, 224, 76),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        'Genres',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 10, right: 20),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                primary: const Color(0xffE32E00)),
                            onPressed: (() {}),
                            child: const Text(
                              'Comedy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                primary: const Color(0xff850C5C)),
                            onPressed: (() {}),
                            child: const Text(
                              'Health & Wellness',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                primary: const Color(0xffCA032C),
                              ),
                              onPressed: (() {}),
                              child: const Text(
                                'Society',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  primary: const Color(0xff0C856F)),
                              onPressed: (() {}),
                              child: const Text(
                                'Culture',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              primary: const Color(0xff0341AF),
                            ),
                            onPressed: (() {}),
                            child: const Text(
                              'Technology',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
                      child: Text(
                        'Trending',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 150.h,
                      child: SizedBox(
                        height: 150.h,
                        width: 300.w,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () => feedsBottomSheet(context),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://media.istockphoto.com/id/1471715408/photo/two-young-stylish-radio-show-hosts-record-fresh-podcast-episode-in-home-loft-studio-apartment.jpg?s=612x612&w=0&k=20&c=_5o0glsgMBzhiQU6MsxGS4aYfkBPFs3NaQiTGMyBHVA=',
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      '#Trending',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    const Text(
                                      'Genre Revolution: Shattering Boundaries,\nUnleashing a New Era of Sound!',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      // height: 50.h,
                                      // width: 150.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            side: const BorderSide(
                                                color: Colors.white, width: 2),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        onPressed: (() {
                                          setState(() {
                                            _incrementCounter();
                                          });
                                        }),
                                        child: const Text(
                                          'Listening Now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        'Top Podcast',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Podcast()),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 0.00,
                                      right: 25.00),
                                  height: 200.h,
                                  width: 250.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120.h,
                                        width: 250.w,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://media.istockphoto.com/id/1420789680/vector/girl-in-headphones-speaks-into-the-microphone-recording-podcast-in-studio-radio-broadcasting.jpg?s=612x612&w=0&k=20&c=DyUAJFWEBaaTmkhDHJkq4maVoqim1H76ZBQC3zHmN14='),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 11.h, horizontal: 11.w),
                                        child: const Text(
                                          'Brunch-Talk',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                      ),
                    )
                  ],
                ),
              ));
        })),
      ),
    );
  }
}
