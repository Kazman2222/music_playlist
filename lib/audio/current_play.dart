import 'dart:ui';

import 'package:audio_playlist/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future isplayingBottomSheet(BuildContext context) {
  String networkImage =
      'https://img.buzzfeed.com/buzzfeed-static/complex/images/csay5rvhyzcfwy9hzkcx/wizkid.png?downsize=920:*&output-format=auto&output-quality=auto';

  // https://guardian.ng/wp-content/uploads/2022/03/Rema-Rave-and-Roses-Album-1200x1200-1.jpeg

  String networkImage2 =
      'https://guardian.ng/wp-content/uploads/2022/03/Rema-Rave-and-Roses-Album-1200x1200-1.jpeg';

  String networkImage3 =
      'https://hiddenremote.com/files/image-exchange/2023/07/ie_105426.jpeg';

  String networkImage4 =
      'https://pbs.twimg.com/media/DyGkj-cU0AAGLH-?format=jpg&name=4096x4096';

  String networkImage5 =
      'https://www.bellanaija.com/wp-content/uploads/2022/07/293564498_1208386089976695_2249588927290283092_n.jpg';

  String networkImage6 =
      'https://cdns-images.dzcdn.net/images/cover/a713fbee0c9e591de8b8b5a2f3a65c6b/500x500.jpg';

  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        String pics = networkImage2;
        String artistname = 'Rema';
        String Albumname = 'rave and roses';
        String songname = 'Charm';
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pics), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  // color: Colors.tealAccent
                ),
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    // blendMode: BlendMode.saturation,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: const Color(0xffC0C0C0).withOpacity(0.7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          artistname,
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 180.h,
                          width: 150.w,
                          child: Image.network(pics),
                        ),
                        Text(
                          songname,
                          style: GoogleFonts.lato(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                              color: Colors.black),
                        ),
                        Text(
                          Albumname.toUpperCase(),
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Slider(
                                    activeColor: Colors.white,
                                    min: 0.0,
                                    max: 100.0,
                                    value: 20,
                                    onChanged: ((value) {})),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '15:25',
                                      style: GoogleFonts.lato(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '27.30',
                                      style: GoogleFonts.lato(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Icon(Icons.loop_outlined,
                                    //     color:
                                    //         Color.fromARGB(255, 244, 242, 242),
                                    //     size: 28),
                                    const Icon(Icons.skip_previous_outlined,
                                        color: Colors.white, size: 28),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          primary:
                                              Colors.black.withOpacity(0.4)),
                                      onPressed: () {},
                                      // child: null,
                                      child: const SizedBox(
                                        height: 55,
                                        width: 42,
                                        child: Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 42,
                                        ),
                                      ),
                                    ),
                                    const Icon(Icons.skip_next_outlined,
                                        color: Colors.white, size: 28),
                                    // Icon(Icons.volume_up_outlined,
                                    //     color: Colors.white, size: 28),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(Icons.playlist_add,
                                        color: Colors.white, size: 28),
                                    Icon(Icons.loop_outlined,
                                        color: Colors.white, size: 28),
                                    Icon(Icons.shuffle,
                                        color: Colors.white, size: 28),
                                    Icon(Icons.favorite_outline_sharp,
                                        color: Colors.white, size: 28),
                                    Icon(Icons.volume_up_outlined,
                                        color: Colors.white, size: 28),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
