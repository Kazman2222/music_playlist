import 'dart:io';

import 'package:audio_playlist/constants.dart';
import 'package:audio_playlist/home/final_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

import '../api/firebase_api.dart';
import '../components/buttons.dart';
import '../popUps/utils.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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

  UploadTask? Pictask;
  File? Picfile;

  late String picdataDestination;
  bool pic = false;

  Widget build(BuildContext context) {
    final picName =
        Picfile != null ? basename(Picfile!.path) : 'No File Selelected';

    // String picdata;

    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar:
          buildAppBars(text: 'Profile', onTap: () => Navigator.pop(context)),
      body: StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.data!.docs.length != 0) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    String name = documentSnapshot['firstname'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        // FutureBuilder<List<Map<String, String>>>(
                        //     future:
                        //         FirebaseApi().fetchAllAudioFiles('ProfilePic'),
                        //     builder: (context, snapshot) {
                        //       try {
                        //         if (snapshot.connectionState ==
                        //             ConnectionState.waiting) {
                        //           return Center(
                        //             child: Stack(
                        //               children: [
                        //                 Container(
                        //                   decoration: const BoxDecoration(
                        //                       shape: BoxShape.circle,
                        //                       color: Colors.white),
                        //                   height: 200,
                        //                   width: 200,
                        //                   child: Image.asset(
                        //                     "assets/pics/premium.png",
                        //                     fit: BoxFit.fill,
                        //                   ),
                        //                   clipBehavior: Clip.hardEdge,
                        //                 ),
                        //                 Positioned(
                        //                   left: 150,
                        //                   top: 150,
                        //                   child: GestureDetector(
                        //                     onTap: selectCoverPhoto,
                        //                     child: Container(
                        //                       decoration: const BoxDecoration(
                        //                           shape: BoxShape.circle,
                        //                           color: Colors.black),
                        //                       child: Padding(
                        //                         padding:
                        //                             const EdgeInsets.all(8.0),
                        //                         child: Icon(
                        //                           Icons.add,
                        //                           color: Colors.green,
                        //                           size: 30,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           );
                        //         }
                        //
                        //         if (snapshot.hasError) {
                        //           throw snapshot.error!;
                        //         }
                        //
                        //         final MetadataList = snapshot.data;
                        //
                        //         if (MetadataList!.isEmpty) {
                        //           return Center(
                        //             child: Stack(
                        //               children: [
                        //                 Container(
                        //                   decoration: const BoxDecoration(
                        //                       shape: BoxShape.circle,
                        //                       color: Colors.white),
                        //                   height: 200,
                        //                   width: 200,
                        //                   child: Image.asset(
                        //                     "assets/pics/premium.png",
                        //                     fit: BoxFit.fill,
                        //                   ),
                        //                   clipBehavior: Clip.hardEdge,
                        //                 ),
                        //                 Positioned(
                        //                   left: 150,
                        //                   top: 150,
                        //                   child: GestureDetector(
                        //                     onTap: selectCoverPhoto,
                        //                     child: Container(
                        //                       decoration: const BoxDecoration(
                        //                           shape: BoxShape.circle,
                        //                           color: Colors.black),
                        //                       child: Padding(
                        //                         padding:
                        //                             const EdgeInsets.all(8.0),
                        //                         child: Icon(
                        //                           Icons.add,
                        //                           color: Colors.green,
                        //                           size: 30,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           );
                        //         }
                        //
                        //         // NetworkImage(
                        //         //     coverPhoto == null
                        //         //         ? 'https://media.istockphoto.com/id/1391397901/photo/contemporary-art-collage-stylish-silhouette-of-man-male-casual-fashion-isolated-over-abstract.jpg?s=612x612&w=0&k=20&c=qpP01m5xctaam9bWFYd58SrGw-lOmmZMiChN2ENo-DU='
                        //         //         : coverPhoto)
                        //
                        //         return Container(
                        //           padding:
                        //               EdgeInsets.symmetric(horizontal: 8.0),
                        //           height: 230,
                        //           width: double.infinity,
                        //           child: ListView.builder(
                        //               itemCount: MetadataList.length,
                        //               scrollDirection: Axis.horizontal,
                        //               shrinkWrap: true,
                        //               itemBuilder: ((context, index) {
                        //                 final metadata = MetadataList[index];
                        //                 final profilePhoto =
                        //                     metadata['Profile Photo'];
                        //                 final id = metadata['id'];
                        //
                        //                 if (id == usero.email) {
                        //                   return Center(
                        //                     child: Stack(
                        //                       children: [
                        //                         Container(
                        //                           decoration:
                        //                               const BoxDecoration(
                        //                                   shape:
                        //                                       BoxShape.circle,
                        //                                   color: Colors.white),
                        //                           height: 200,
                        //                           width: 200,
                        //                           child: Image.network(
                        //                             profilePhoto!,
                        //                             fit: BoxFit.fill,
                        //                           ),
                        //                           clipBehavior: Clip.hardEdge,
                        //                         ),
                        //                         Positioned(
                        //                           left: 150,
                        //                           top: 150,
                        //                           child: GestureDetector(
                        //                             onTap: selectCoverPhoto,
                        //                             child: Container(
                        //                               decoration:
                        //                                   const BoxDecoration(
                        //                                       shape: BoxShape
                        //                                           .circle,
                        //                                       color:
                        //                                           Colors.black),
                        //                               child: Padding(
                        //                                 padding:
                        //                                     const EdgeInsets
                        //                                         .all(8.0),
                        //                                 child: Icon(
                        //                                   Icons.add,
                        //                                   color: Colors.green,
                        //                                   size: 30,
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         )
                        //                       ],
                        //                     ),
                        //                   );
                        //                 } else {
                        //                   return Center(
                        //                     child: Stack(
                        //                       children: [
                        //                         Container(
                        //                           decoration:
                        //                               const BoxDecoration(
                        //                                   shape:
                        //                                       BoxShape.circle,
                        //                                   color: Colors.white),
                        //                           height: 200,
                        //                           width: 200,
                        //                           child: Image.asset(
                        //                             "assets/pics/premium.png",
                        //                             fit: BoxFit.fill,
                        //                           ),
                        //                           clipBehavior: Clip.hardEdge,
                        //                         ),
                        //                         Positioned(
                        //                           left: 150,
                        //                           top: 150,
                        //                           child: GestureDetector(
                        //                             onTap: selectCoverPhoto,
                        //                             child: Container(
                        //                               decoration:
                        //                                   const BoxDecoration(
                        //                                       shape: BoxShape
                        //                                           .circle,
                        //                                       color:
                        //                                           Colors.black),
                        //                               child: Padding(
                        //                                 padding:
                        //                                     const EdgeInsets
                        //                                         .all(8.0),
                        //                                 child: Icon(
                        //                                   Icons.add,
                        //                                   color: Colors.green,
                        //                                   size: 30,
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         )
                        //                       ],
                        //                     ),
                        //                   );
                        //                 }
                        //               })),
                        //         );
                        //       } catch (error) {
                        //         return Center(
                        //           child: Stack(
                        //             children: [
                        //               Container(
                        //                 decoration: const BoxDecoration(
                        //                     shape: BoxShape.circle,
                        //                     color: Colors.white),
                        //                 height: 200,
                        //                 width: 200,
                        //                 child: Image.asset(
                        //                   "assets/pics/premium.png",
                        //                   fit: BoxFit.fill,
                        //                 ),
                        //                 clipBehavior: Clip.hardEdge,
                        //               ),
                        //               Positioned(
                        //                 left: 150,
                        //                 top: 150,
                        //                 child: GestureDetector(
                        //                   onTap: selectCoverPhoto,
                        //                   child: Container(
                        //                     decoration: const BoxDecoration(
                        //                         shape: BoxShape.circle,
                        //                         color: Colors.black),
                        //                     child: Padding(
                        //                       padding:
                        //                           const EdgeInsets.all(8.0),
                        //                       child: Icon(
                        //                         Icons.add,
                        //                         color: Colors.green,
                        //                         size: 30,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         );
                        //       }
                        //     }),
                        // Image.asset(
                        //   "assets/pics/premium.png",
                        //   fit: BoxFit.fill,
                        // )
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                height: 200,
                                width: 200,
                                child: FutureBuilder<List<Map<String, String>>>(
                                  future: FirebaseApi()
                                      .fetchAllAudioFiles('ProfilePic'),
                                  builder: (context, snapshot) {
                                    try {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Image.asset(
                                          "assets/pics/premium.png",
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
                                        return Image.asset(
                                          "assets/pics/premium.png",
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
                                        setState(() {
                                          pic = true;
                                        });
                                        return Image.asset(
                                          "assets/pics/premium.png",
                                          fit: BoxFit.fill,
                                        );
                                      } else {
                                        final profilePhoto =
                                            userProfilePhoto['Profile Photo'];

                                        final profilePhotoData =
                                            userProfilePhoto['Destination'];

                                        picdataDestination = profilePhotoData!;

                                        return Image.network(
                                          profilePhoto!,
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
                                      return Image.asset(
                                        "assets/pics/premium.png",
                                        fit: BoxFit.fill,
                                      );
                                    }
                                  },
                                ),
                                clipBehavior: Clip.hardEdge,
                              ),
                              Positioned(
                                left: 150,
                                top: 150,
                                child: GestureDetector(
                                  onTap: selectCoverPhoto,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            name.toUpperCase(),
                            style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: SizedBox(
                            height: 60.h,
                            width: 200.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: Colors.green),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/register'),
                              child: Text(
                                'View Profile',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          child: Column(
                            children: [
                              buildPadding(),
                              InkButton(
                                icon1: Icons.playlist_add,
                                text1: 'Playlist',
                                onTap: () {
                                  null;
                                },
                                icon2: Icons.arrow_forward_ios,
                              ),
                              buildPadding(),
                              InkButton(
                                icon1: Icons.favorite_outline_sharp,
                                text1: 'Likes',
                                onTap: () {
                                  null;
                                },
                                icon2: Icons.arrow_forward_ios,
                              ),
                              buildPadding(),
                              InkButton(
                                icon1: Icons.info_outline,
                                text1: 'About',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/editProfileDetail');
                                },
                                icon2: Icons.arrow_forward_ios,
                              ),
                              buildPadding(),
                              InkButton(
                                icon1: Icons.thumb_up_alt_outlined,
                                text1: 'Accolades',
                                onTap: () {
                                  null;
                                },
                                icon2: Icons.arrow_forward_ios,
                              ),
                              buildPadding(),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            "assets/pics/premium.png",
                            fit: BoxFit.fill,
                          ),
                          clipBehavior: Clip.hardEdge,
                        ),
                        Positioned(
                          left: 150,
                          top: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'Guest',
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60.h,
                      width: 200.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Colors.green),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                        child: Text(
                          'View Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 25.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    child: Column(
                      children: [
                        buildPadding(),
                        InkButton(
                          icon1: Icons.playlist_add,
                          text1: 'Playlist',
                          onTap: () {
                            null;
                          },
                          icon2: Icons.arrow_forward_ios,
                        ),
                        buildPadding(),
                        InkButton(
                          icon1: Icons.favorite_outline_sharp,
                          text1: 'Likes',
                          onTap: () {
                            null;
                          },
                          icon2: Icons.arrow_forward_ios,
                        ),
                        buildPadding(),
                        InkButton(
                          icon1: Icons.info_outline,
                          text1: 'About',
                          onTap: () {
                            Navigator.pushNamed(context, '/artistProfile');
                          },
                          icon2: Icons.arrow_forward_ios,
                        ),
                        buildPadding(),
                        InkButton(
                          icon1: Icons.thumb_up_alt_outlined,
                          text1: 'Accolades',
                          onTap: () {
                            null;
                          },
                          icon2: Icons.arrow_forward_ios,
                        ),
                        buildPadding(),
                      ],
                    ),
                  ),
                ],
              ));
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else {
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          "assets/pics/premium.png",
                          fit: BoxFit.fill,
                        ),
                        clipBehavior: Clip.hardEdge,
                      ),
                      Positioned(
                        left: 150,
                        top: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    'Guest',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: SizedBox(
                    height: 60.h,
                    width: 200.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.green),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: Text(
                        'View Profile',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: Column(
                    children: [
                      buildPadding(),
                      InkButton(
                        icon1: Icons.playlist_add,
                        text1: 'Playlist',
                        onTap: () {
                          null;
                        },
                        icon2: Icons.arrow_forward_ios,
                      ),
                      buildPadding(),
                      InkButton(
                        icon1: Icons.favorite_outline_sharp,
                        text1: 'Likes',
                        onTap: () {
                          null;
                        },
                        icon2: Icons.arrow_forward_ios,
                      ),
                      buildPadding(),
                      InkButton(
                        icon1: Icons.info_outline,
                        text1: 'About',
                        onTap: () {
                          Navigator.pushNamed(context, '/artistProfile');
                        },
                        icon2: Icons.arrow_forward_ios,
                      ),
                      buildPadding(),
                      InkButton(
                        icon1: Icons.thumb_up_alt_outlined,
                        text1: 'Accolades',
                        onTap: () {
                          null;
                        },
                        icon2: Icons.arrow_forward_ios,
                      ),
                      buildPadding(),
                    ],
                  ),
                ),
              ],
            ));
          }
        },
      ),
    );
  }

  Future selectCoverPhoto() async {
    if (pic == false) {
      await deleteExistingProfilePhoto(picdataDestination);
    }

    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false, type: FileType.image // Specify audio file type
        );

    if (result == null) {
      Utils.showErrorSnackBar('No File Selected');
    } else {
      Utils.showSnackBar('File Selected');
    }

    final path = result?.files.single.path!;
    // print(path);

    setState(() => Picfile = File(path!));

    Future.delayed(const Duration(seconds: 5), () {
      // Here you can write your code
      // setState(() {
      //   // Here you can write your code for open new view
      //   ticktock = true;
      //   file = null;
      //   Picfile = null;
      // });
      uploadFile();
    });
  }

  Future uploadFile() async {
    if (Picfile == null) {
      Utils.showErrorSnackBar('Can\'t Upload Nothing!');
    }

    final PicfileName = basename(Picfile!.path);
    final picsdestination = 'ProfilePic/$PicfileName';

    Pictask = FirebaseApi.uploadProfilePic(
        picsdestination, Picfile!, usero.email.toString());

    setState(() {});

    if (Pictask == null) {
      Utils.showErrorSnackBar('Upload Error');
    } else {
      Utils.showSnackBar('Upload Successful');
    }

    final picsnapshot = await Pictask!.whenComplete(() {});
    final pictureurlDownload = await picsnapshot.ref.getDownloadURL();

    print('Download-Link: $pictureurlDownload');

    final success =
        await setMetadataWithDownloadURL(pictureurlDownload, picsdestination);

    if (success) {
      print('Metadata updated with download URL');
      // You can update your UI or perform other actions here
    } else {
      print('Failed to update metadata with download URL');
      // Handle the failure case
    }
  }

  Future<bool> setMetadataWithDownloadURL(
      String downloadPicURL, String destination) async {
    print('i was called also');
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      final werk = destination;
      // print('This is: $werk'); // Replace with your file path
      final customMetadata = <String, String>{
        'Profile Photo': downloadPicURL,
        'Destination': werk.toString(),
      };
      await ref
          .updateMetadata(SettableMetadata(customMetadata: customMetadata));
      return true; // Metadata update successful
    } catch (e) {
      print('Error updating metadata: $e');
      return false; // Metadata update failed
    }
  }

  Future<void> deleteExistingProfilePhoto(String pictureurlDownload) async {
    try {
      final imageReference =
          FirebaseStorage.instance.ref().child('$pictureurlDownload');
      imageReference.delete();
    } catch (e) {
      print('Error deleting existing profile photo: $e');
    }
  }
}
