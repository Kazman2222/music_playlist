import 'package:audio_playlist/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/firebase_api.dart';
import '../components/buttons.dart';

class profile_information extends StatefulWidget {
  const profile_information({super.key});

  @override
  State<profile_information> createState() => _profile_informationState();
}

class _profile_informationState extends State<profile_information> {
  final usero = FirebaseAuth.instance.currentUser!;
  late Stream stream;
  @override
  void initState() {
    super.initState();
    stream = FirebaseFirestore.instance
        .collection('registraton')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .snapshots();
  }

  String kPicture =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff212121),
        appBar:
            buildAppBars(text: 'About', onTap: () => Navigator.pop(context)),
        body: StreamBuilder(
          stream: stream,
          builder: ((context, AsyncSnapshot<dynamic> streamSnapshot) {
            if (streamSnapshot.hasData) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (streamSnapshot.data!.docs.length != 0) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: FutureBuilder<List<Map<String, String>>>(
                                  future: FirebaseApi()
                                      .fetchAllAudioFiles('ProfilePic'),
                                  builder: (context, snapshot) {
                                    try {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Image(
                                          height: 300.h,
                                          width: double.infinity,
                                          image: NetworkImage(kPicture),
                                          fit: BoxFit.fill,
                                        );
                                      }

                                      if (snapshot.hasError) {
                                        // print('i was called');
                                        // setState(() {
                                        //   pic = true;
                                        // });
                                        throw snapshot.error!;
                                      }

                                      final metadataList = snapshot.data;

                                      if (metadataList!.isEmpty) {
                                        // print('i was requested');
                                        // setState(() {
                                        //   pic = true;
                                        // });
                                        return Image(
                                          height: 300.h,
                                          width: double.infinity,
                                          image: NetworkImage(kPicture),
                                          fit: BoxFit.fill,
                                        );
                                      }

                                      // Find the user's profile photo by matching the ID

                                      final userProfilePhoto =
                                          metadataList.firstWhere(
                                        (metadata) =>
                                            metadata['id'] == usero.email,
                                        orElse: () => {},
                                      );

                                      if (userProfilePhoto.isEmpty) {
                                        return Image(
                                          height: 300.h,
                                          width: double.infinity,
                                          image: NetworkImage(kPicture),
                                          fit: BoxFit.fill,
                                        );
                                      } else {
                                        final profilePhoto =
                                            userProfilePhoto['Profile Photo'];

                                        return Image(
                                          height: 300.h,
                                          width: double.infinity,
                                          image: NetworkImage(profilePhoto!),
                                          fit: BoxFit.fill,
                                        );
                                      }
                                      //
                                      // final profilePhoto =
                                      //     userProfilePhoto['Profile Photo'];
                                      // final profilePhotoData =
                                      //     userProfilePhoto['Destination'];
                                      // picdataDestination = profilePhotoData!;
                                      //
                                      // return Image.network(
                                      //   profilePhoto!,
                                      //   fit: BoxFit.fill,
                                      // );
                                    } catch (error) {
                                      return Image(
                                        height: 300.h,
                                        width: double.infinity,
                                        image: NetworkImage(kPicture),
                                        fit: BoxFit.fill,
                                      );
                                    }
                                  },
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              documentSnapshot['firstname'].toUpperCase() +
                                  '\n' +
                                  documentSnapshot['lastname'].toUpperCase(),
                              style: GoogleFonts.raleway(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "a.k.a",
                                    style: GoogleFonts.raleway(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                    children: [
                                      WidgetSpan(
                                        child: SizedBox(
                                          width: 5.w,
                                        ),
                                      ),
                                      TextSpan(
                                        text: documentSnapshot['stagename'],
                                        style: GoogleFonts.raleway(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
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
                                    onPressed: (() {}),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          // size: 16.sp,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Follow',
                                          style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Latest',
                              style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Popular',
                              style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           '6,500,000',
                            //           textAlign: TextAlign.start,
                            //           style: GoogleFonts.lato(
                            //               fontSize: 20,
                            //               fontWeight: FontWeight.bold,
                            //               fontStyle: FontStyle.italic,
                            //               color: Colors.white),
                            //         ),
                            //         Text(
                            //           'Monthly Listeners',
                            //           textAlign: TextAlign.start,
                            //           style: GoogleFonts.lato(
                            //               fontSize: 13,
                            //               fontWeight: FontWeight.bold,
                            //               fontStyle: FontStyle.normal,
                            //               color: Colors.green),
                            //         )
                            //       ],
                            //     ),
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.end,
                            //       children: [
                            //         Text(
                            //           '500,000',
                            //           textAlign: TextAlign.end,
                            //           style: GoogleFonts.lato(
                            //               fontSize: 20,
                            //               fontWeight: FontWeight.bold,
                            //               fontStyle: FontStyle.italic,
                            //               color: Colors.white),
                            //         ),
                            //         Text(
                            //           'Followers',
                            //           textAlign: TextAlign.end,
                            //           style: GoogleFonts.lato(
                            //               fontSize: 13,
                            //               fontWeight: FontWeight.bold,
                            //               fontStyle: FontStyle.normal,
                            //               color: Colors.green),
                            //         )
                            //       ],
                            //     )
                            //   ],
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Info',
                              style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                            const Divider(
                              thickness: 1,
                              // height: 3,
                              color: Colors.white,
                            ),
                            documentSnapshot['tellUsAboutYourself'].isEmpty
                                ? Text(
                                    'Nicki Minaj, original name Onika Tanya Maraj, (born December 8, 1982, St. James, Trinidad and Tobago), Trinidadian-born singer, songwriter, television personality, and actress who was known for her flowing quick-spoken rap style and for her provocative lyrics. She complemented her music with a bold persona that included colourful wigs and risqué clothing.',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        height: 1.5),
                                  )
                                : Text(
                                    documentSnapshot['tellUsAboutYourself'],
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        height: 1.5),
                                  ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              color: Colors.white,
                              height: 1.5,
                              thickness: 1.5,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nationality',
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  documentSnapshot['nationality'],
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Gender',
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  documentSnapshot['gender'],
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              } else {
                return ProfileDetails();
              }
            } else {
              return ProfileDetails();
            }
          }),
        ));
  }
}
