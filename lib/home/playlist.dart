import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:audio_playlist/constants.dart';
import 'package:flutter/material.dart';

import '../artistesdetails/profile.dart';

class playlist extends StatefulWidget {
  const playlist({super.key});

  @override
  State<playlist> createState() => _playlistState();
}

class _playlistState extends State<playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 71, 224, 76),
                            radius: 20,
                            child: Text('J',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Your Playlist',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.search,
                          size: 29,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add,
                          size: 29,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  'Recent',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Container(
                height: 230,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/1391397901/photo/contemporary-art-collage-stylish-silhouette-of-man-male-casual-fashion-isolated-over-abstract.jpg?s=612x612&w=0&k=20&c=qpP01m5xctaam9bWFYd58SrGw-lOmmZMiChN2ENo-DU='),
                                fit: BoxFit.cover)),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 140, 140, 140)
                                  .withOpacity(0.9),
                          radius: 25,
                          child: const Icon(
                            Icons.play_arrow,
                            color: Color.fromARGB(255, 219, 217, 217),
                            size: 29,
                          ),
                        ),
                      );
                    })),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.green),
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Add Playlist',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, bottom: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Trending Playlist',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      'view all',
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
              ),
              Container(
                height: 270,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(15)),
                        width: 250,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Image(
                                    height: 100,
                                    width: 100,
                                    image: NetworkImage(
                                        'https://media.istockphoto.com/id/1411633545/photo/stylish-emotional-senior-man-playing-guitar-over-blue-background-collage-in-magazine-style.jpg?s=612x612&w=0&k=20&c=aP4lyXmA3klV4Ak58HKySDWyLOpTbK9ZCq2ryCIs7aM='),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Steven Edisenn Elena',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Podcastly')
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Slider(
                                activeColor: Colors.white,
                                min: 0.0,
                                max: 100.0,
                                value: 20,
                                onChanged: ((value) {})),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '15:25',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('27:30',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(Icons.loop_outlined,
                                    color: Color.fromARGB(255, 244, 242, 242),
                                    size: 28),
                                Icon(Icons.skip_previous_outlined,
                                    color: Colors.white, size: 28),
                                Icon(
                                  Icons.play_circle,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                Icon(Icons.skip_next_outlined,
                                    color: Colors.white, size: 28),
                                Icon(Icons.volume_up_outlined,
                                    color: Colors.white, size: 28),
                              ],
                            )
                          ],
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const bottom(),
    );
  }
}
