import 'dart:io';

import 'package:audio_playlist/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

import '../api/firebase_api.dart';
import '../components/buttons.dart';
import '../components/selection.dart';
import '../popUps/utils.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddMusic extends StatefulWidget {
  const AddMusic({Key? key}) : super(key: key);

  // final void Function(String downloadURL) onDownloadURLAvailable;
  //
  // AddMusic({required this.onDownloadURLAvailable});
  // late final void Function(String downloadURL) onDownloadURLAvailable;

  @override
  State<AddMusic> createState() => _AddMusicState();
}

class _AddMusicState extends State<AddMusic> with TickerProviderStateMixin {
  final usero = FirebaseAuth.instance.currentUser!;
  // double size = 100.5;
  int time = 15;
  String timing = 'seconds';
  // int percent = 0;
  // bool tap = false;
  bool ticktock = false;
  final _formKey = GlobalKey<FormState>();

  UploadTask? task;
  File? file;

  UploadTask? Pictask;
  File? Picfile;

  // UploadTask? pictask;
  // File? picfile;

  // late AnimationController controls;
  //
  // void hitInstance() {
  //   // late AnimationController controls;
  //   // TODO: implement initState
  //   // super.initState();
  //   setState(() {
  //     tap = true;
  //   });
  //
  //   controls = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 20),
  //     upperBound: 1,
  //     // animation doesn't need a Bound!
  //   );
  //
  //   controls.forward();
  //
  //   controls.addListener(() {
  //     setState(() {});
  //     print(controls.value);
  //   });
  // }
  //
  // void cancelInstance() {
  //   // late AnimationController controls;
  //   // TODO: implement initState
  //   // super.initState();
  //   setState(() {
  //     tap = false;
  //   });
  //   print('I WAS PRESSED');
  //
  //   // void dispose() {
  //   //   controls.dispose();
  //   //   super.dispose();
  //   // }
  //   //
  //   // dispose();
  // }
  //
  // @override
  // void dispose() {
  //   controls.dispose();
  //   super.dispose();
  // }

  final Titles = TextEditingController();
  final Artiste = TextEditingController();
  final Album = TextEditingController();
  String Genre = 'POP';
  DateTime Release_Date = DateTime(2023, 8, 03);
  // final aboutselfController = TextEditingController();
  // final nationalityController = TextEditingController();

  // bool _validateTitle = false;
  // bool _validateArtiste = false;
  // bool _validateAlbum = false;

  Row andriodDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String song in genre) {
      String songs = song;
      var newItem = DropdownMenuItem(
        value: songs,
        child: Text(
          songs,
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      );
      dropdownItems.add(newItem);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: Genre,
          items: dropdownItems,
          onChanged: (value) {
            setState(() {
              Genre = value.toString();
            });
            // kvalMoney = value;
          },
          dropdownColor: kBackGroundColour,
        ),
      ],
    );
  }

// List<DropdownMenuItem<String>> getDropdownCurrency() {
//
// }

  CupertinoPicker iOSPicker() {
    List<Widget> cupertinoDropdown = [];
    for (String song in genre) {
      Widget genreList = Text(song);
      cupertinoDropdown.add(genreList);
    }
    return CupertinoPicker(
        // IOS Selection
        backgroundColor: Colors.lightBlue,
        magnification: 1.0,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            Genre = genre[selectedIndex].toString();
          });
        },
        children: cupertinoDropdown);
  }

  Widget getPicker() {
    if (!kIsWeb && Platform.isIOS) {
      return iOSPicker();
    } else {
      return andriodDropdown();
    }
  }

  @override
  void dispose() {
    Titles.dispose();
    Artiste.dispose();
    Album.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double value = tap ? controls.value : 0.0;
    // double per = value * 100;
    // int percentage = per.toInt();

    final fileName = file != null ? basename(file!.path) : 'No File Selelected';
    final picName =
        Picfile != null ? basename(Picfile!.path) : 'No File Selelected';

    return Scaffold(
      backgroundColor: kBackGroundColour,
      appBar: buildAppBars(
        text: 'Add Music',
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Add Your Music Here',
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'assets/favicons/hand.png',
                    height: 30,
                    width: 30,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // CircularProgressIndicator(
              //   value: 0.3,
              //   color: Colors.greenAccent, //<-- SEE HERE
              //   backgroundColor: Colors.grey, //<-- SEE HERE
              // ),
              Center(
                child: DottedBorder(
                  // Color color = Colors.black,
                  // double strokeWidth = 1,
                  // BorderType borderType = BorderType.Rect,
                  // List  dashPattern = const  [3, 1],
                  // EdgeInsets padding = const EdgeInsets.all(2),
                  // EdgeInsets borderPadding = EdgeInsets.zero,
                  // Radius radius = const Radius.circular(0),
                  // StrokeCap strokeCap = StrokeCap.butt,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  strokeWidth: 3,
                  color: Colors.white,
                  strokeCap: StrokeCap.butt,
                  dashPattern: const [6, 6],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: selectfile,
                      child: Container(
                        width: double.infinity,
                        height: 300.h,
                        color: const Color(0xff535353),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  fileName,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: Colors.white,
                                  size: 40.sp,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Drag & drop or ',
                                    style: GoogleFonts.lato(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'choose file',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      TextSpan(text: ' to upload'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'MP3, AVI or MKV',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Title',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 99, 241, 104),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: Titles,
                        validator: ((value) =>
                            value!.isEmpty ? 'Enter Song Name' : null),
                        textAlign: TextAlign.start,
                        decoration: kTextFieldDecoration.copyWith(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: 'Song Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Artist',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 99, 241, 104),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 90,
                    //   child: TextField(
                    //     controller: Artiste,
                    //     textAlign: TextAlign.start,
                    //     maxLines: null,
                    //     expands: true,
                    //     // keyboardType: TextInputType.multiline,
                    //     decoration: kTextFieldDecoration.copyWith(
                    //       filled: true,
                    //       fillColor: Colors.grey,
                    //       hintText: 'Stage Name...(A.K.A)',
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      child: TextFormField(
                        controller: Artiste,
                        validator: ((value) => value!.isEmpty
                            ? 'The Artist Name must be provided'
                            : null),
                        textAlign: TextAlign.start,
                        decoration: kTextFieldDecoration.copyWith(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: 'Stage Name...(A.K.A)',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Album',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 99, 241, 104),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextFormField(
                        controller: Album,
                        validator: ((value) =>
                            value!.isEmpty ? 'Song Album for Song' : null),
                        textAlign: TextAlign.start,
                        decoration: kTextFieldDecoration.copyWith(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: 'If Single specify "Single".',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Genre',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 99, 241, 104),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 60.0,
                alignment: Alignment.center,
                color: const Color(0xff535353),
                // padding: const EdgeInsets.only(bottom: 20.0),
                child: getPicker(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Release Date',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 99, 241, 104),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: Release_Date,
                  onDateTimeChanged: (DateTime newDateTime) {
                    // Do something
                    Release_Date = newDateTime;
                    print(Release_Date);
                  },
                  backgroundColor: const Color(0xff535353),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Cover Photo',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 99, 241, 104),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(20),
                  strokeWidth: 3,
                  color: Colors.white,
                  strokeCap: StrokeCap.butt,
                  dashPattern: const [6, 6],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: selectCoverPhoto,
                      child: Container(
                        width: double.infinity,
                        height: 200.h,
                        color: const Color(0xff535353),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  picName,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: Colors.white,
                                  size: 40.sp,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Drag & drop or ',
                                    style: GoogleFonts.lato(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.white),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'choose file',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      TextSpan(text: ' to upload'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'JPG, JPEG or PNG',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              task != null ? buildUploadStatus(task!, context) : Container(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 140.w,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.black),
                      onPressed: (() {}),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: Colors.green),
                      onPressed: uploadFile,
                      child: const Text(
                        'Import',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // FutureBuilder(
              //     future: FirebaseApi().ListFiles('songs'),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<firebase_storage.ListResult> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done &&
              //           snapshot.hasData) {
              //         return Container(
              //           height: 80,
              //           // padding: const EdgeInsets.symmetric(horizontal: 20),
              //           child: ListView.builder(
              //               shrinkWrap: true,
              //               scrollDirection: Axis.horizontal,
              //               itemCount: snapshot.data!.items.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: ElevatedButton(
              //                     onPressed: () {},
              //                     child: Text(snapshot.data!.items[index].name),
              //                   ),
              //                 );
              //               }),
              //         );
              //       } else if (snapshot.connectionState ==
              //               ConnectionState.waiting ||
              //           !snapshot.hasData) {
              //         return const Center(
              //             child: CircularProgressIndicator(
              //           color: Colors.green,
              //         ));
              //       } else {
              //         return Container();
              //       }
              //     }),
              //
              // const SizedBox(
              //   height: 20,
              // ),
              //
              // FutureBuilder<List<Map<String, String>>>(
              //   future: FirebaseApi().fetchAllAudioFiles('songs'),
              //   builder: (context, snapshot) {
              //     try {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(child: CircularProgressIndicator());
              //       }
              //
              //       if (snapshot.hasError) {
              //         throw snapshot.error!;
              //       }
              //
              //       final audioMetadataList = snapshot.data;
              //
              //       if (audioMetadataList!.isEmpty) {
              //         return Center(child: Text("No audio files found."));
              //       }
              //
              //       return Container(
              //         height: 180.0,
              //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //         child: ListView.builder(
              //           shrinkWrap: true,
              //           scrollDirection: Axis.horizontal,
              //           itemCount: audioMetadataList.length,
              //           itemBuilder: (context, index) {
              //             final metadata = audioMetadataList[index];
              //             final title = metadata['Song Name'];
              //             final artist = metadata['Artiste'];
              //             final album = metadata['Album'];
              //             final genre = metadata['Genre'];
              //             final release = metadata['Release Date'];
              //             // final audio = metadata['Audio File'];
              //             // final audioUrl = metadata[
              //             //     'audioUrl']; // Replace with your audio URL key
              //
              //             // print(audio);
              //
              //             return Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: ElevatedButton(
              //                 onPressed: () {
              //                   // Implement your logic here for the button press
              //                 },
              //                 child: Center(
              //                   child: Column(
              //                     children: [
              //                       SizedBox(height: 10.0),
              //                       Text(title ?? 'Unknown Title'),
              //                       SizedBox(height: 10.0),
              //                       Text(artist ?? 'Unknown Artist'),
              //                       SizedBox(height: 10.0),
              //                       Text(album ?? 'Unknown Album'),
              //                       SizedBox(height: 10.0),
              //                       Text(genre ?? 'Unknown Genre'),
              //                       SizedBox(height: 10.0),
              //                       Text(release ?? 'Unknown Release Date'),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       );
              //     } catch (error) {
              //       return Center(
              //           child: Container(
              //               color: Colors.deepOrangeAccent,
              //               child: Text("An error occurred: $error")));
              //     }
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false, type: FileType.audio // Specify audio file type
        );

    if (result == null) {
      Utils.showErrorSnackBar('No File Selected');
    } else {
      Utils.showSnackBar('File Selected');
    }

    final path = result?.files.single.path!;
    // print(path);

    setState(() => file = File(path!));
  }

  Future selectCoverPhoto() async {
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
  }

  Future uploadFile() async {
    if (file == null) {
      Utils.showErrorSnackBar('Can\'t Upload Nothing!');
    }

    if (Picfile == null) {
      Utils.showErrorSnackBar('Can\'t Upload Nothing!');
    }

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    final fileName = basename(file!.path);
    final PicfileName = basename(Picfile!.path);
    final destination = 'songs/$fileName';
    final picsdestination = 'CoverPhoto/$PicfileName';

    String type = 'MUSIC';

    // String

    // usero.email!

    task = FirebaseApi.uploadFile(destination, file!, type, usero.email,
        Titles.text, Artiste.text, Album.text, null, null, Genre, Release_Date);

    Pictask = FirebaseApi.uploadPicFile(picsdestination, Picfile!, type);

    setState(() {});

    if (task == null || Pictask == null) {
      Utils.showErrorSnackBar('Upload Error');
    }

    final snapshot = await task!.whenComplete(() {});
    final picsnapshot = await Pictask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    final pictureurlDownload = await picsnapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
    print('Download-Link: $pictureurlDownload');

    final success = await setMetadataWithDownloadURL(
        urlDownload, pictureurlDownload, destination, picsdestination);

    if (success) {
      print('Metadata updated with download URL');
      // You can update your UI or perform other actions here
    } else {
      print('Failed to update metadata with download URL');
      // Handle the failure case
    }

    Titles.clear();
    Artiste.clear();
    Album.clear();
  }

  // Future uploadPicFile() async {
  //   if (picfile == null) {
  //     Utils.showErrorSnackBar('Can\'t Upload Nothing!');
  //   }
  //
  //   final fileName = basename(picfile!.path);
  //   final destination = 'musicCoverImage/$fileName';
  //
  //   pictask = FirebaseApi.uploadFile(destination, picfile!);
  //   setState(() {});
  //
  //   if (pictask == null) {
  //     Utils.showErrorSnackBar('Upload Error');
  //   }
  //
  //   final snapshot = await pictask!.whenComplete(() {});
  //   final urlDownload = await snapshot.ref.getDownloadURL();
  //
  //   print('Download-Link: $urlDownload');
  // }

  Widget buildUploadStatus(UploadTask task, BuildContext Bodycontext) =>
      StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            // final mbsize = snap.totalBytes.toInt();
            final mbytes = snap.totalBytes / (1024 * 1024);
            final megabytes = mbytes.toStringAsFixed(2);
            final progress = snap.bytesTransferred / snap.totalBytes;
            final cprogress = progress * 1.0;
            final percents = (progress * 100).toInt();

            // final fillingName = file != null ? basename(file!.path) : null;

            // DateTime startTime = DateTime.now();
            // // DateTime? startTime;
            //
            // int? elapsedTimeInSeconds;
            // elapsedTimeInSeconds =
            //     DateTime.now().difference(startTime!).inSeconds;
            //
            // // Simulate file upload
            // void simulateFileUpload(int currentStep, int totalSteps) {
            //   sleep(
            //     Duration(seconds: 1),
            //   ); // Simulating a 1-second delay for each step
            // }
            //
            // // Calculate remaining time based on progress and elapsed time
            // int calculateRemainingTime(
            //     double progress, int elapsedTimeInSeconds) {
            //   if (progress == 0.0) return 0; // Avoid division by zero
            //
            //   // Estimated total time (elapsed time / progress) - elapsed time
            //   int remainingTimeInSeconds =
            //       (elapsedTimeInSeconds / progress).round() -
            //           elapsedTimeInSeconds;
            //
            //   return remainingTimeInSeconds < 0 ? 0 : remainingTimeInSeconds;
            // }
            //
            // // Simulating file upload with 10 updates
            // for (int i = 1; i <= 10; i++) {
            //   simulateFileUpload(
            //       i, 10); // Replace this with your actual file upload code
            //
            //   // Progress update
            //   double progress =
            //       i / 10; // Assuming you have 10 steps in your upload process
            //   int elapsedTimeInSeconds =
            //       DateTime.now().difference(startTime).inSeconds;
            //   int remainingTimeInSeconds =
            //       calculateRemainingTime(progress, elapsedTimeInSeconds);
            //
            //   print('Progress: ${progress.toStringAsFixed(2)}');
            //   print('Elapsed Time: $elapsedTimeInSeconds seconds');
            //   print('Remaining Time: $remainingTimeInSeconds seconds\n');
            //   // String remainingTimeString = '$remainingTimeInSeconds seconds left';
            // }
            //
            // calculateRemainingTime(cprogress, elapsedTimeInSeconds);
            // // String remainingTimeString = '$remainingTimeInSeconds seconds left';
            // // print('Mine' + remainingTimeString);

            if (percents == 100) {
              Future.delayed(const Duration(seconds: 5), () {
                // Here you can write your code
                // final downloadURL = await task.snapshot.ref.getDownloadURL();
                //
                // // Call the callback function with the download URL
                // print('Download URL available: $downloadURL');

                // dynamic data = widget.onDownloadURLAvailable;

                // (downloadURL) async {
                //   // Handle the download URL here, e.g., set it in your metadata
                //   print('Again the Download URL available: $downloadURL');
                //
                //   // Now you can set it in your metadata
                //   final success = await setMetadataWithDownloadURL(downloadURL);
                //
                //   if (success) {
                //     print('Metadata updated with download URL');
                //     // You can update your UI or perform other actions here
                //   } else {
                //     print('Failed to update metadata with download URL');
                //     // Handle the failure case
                //   }
                // };

                // AddMusic(
                //     onDownloadURLAvailable: (downloadURL) {
                //       // Handle the download URL here, e.g., set it in your metadata
                //       // You can also update your UI with the URL if needed
                //       print('Download URL available: $downloadURL');
                //
                //       // Now you can set it in your metadata or perform other actions
                //     }
                // );
                setState(() {
                  // Here you can write your code for open new view
                  ticktock = true;
                  file = null;
                  Picfile = null;
                });
                Navigator.pop(Bodycontext);
              });
            }
            return ticktock
                ? Container()
                : Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff535353),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    width: double.infinity,
                    height: 90.h,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  percents == 100
                                      ? SizedBox(
                                          height: 55,
                                          width: 55,
                                          child: Image.asset(
                                            'assets/pics/check.png',
                                          ),
                                        )
                                      : Stack(
                                          children: [
                                            SizedBox(
                                              height: 55,
                                              width: 55,
                                              child: CircularProgressIndicator(
                                                value: cprogress,
                                                strokeWidth: 6.0,
                                                color: Colors
                                                    .greenAccent, //<-- SEE HERE
                                                backgroundColor:
                                                    Colors.grey, //<-- SEE HERE
                                              ),
                                            ),
                                            const Positioned(
                                              top: 10,
                                              left: 11,
                                              child: Icon(
                                                Icons.file_copy,
                                                color: Colors.white,
                                                size: 32,
                                              ),
                                            ),
                                          ],
                                        ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Titles.text,
                                        style: GoogleFonts.lato(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        Artiste.text,
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${megabytes}MB   •  6 seconds remaining',
                                        style: GoogleFonts.lato(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                percents == 100
                                    ? const SizedBox()
                                    : Icon(
                                        Icons.close,
                                        size: 30.sp,
                                        color: Colors.green,
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '$percents%',
                                  style: GoogleFonts.lato(
                                      fontSize: percents == 100 ? 20.sp : 16.sp,
                                      fontWeight: percents == 100
                                          ? FontWeight.w900
                                          : FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ]),
                    ),
                  );
          } else {
            return Container();
          }
        },
      );

  Future<bool> setMetadataWithDownloadURL(String downloadURL,
      String downloadPicURL, String destination, String picsdestination) async {
    print('i was called also');
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      final werk = destination; // Replace with your file path
      final work = picsdestination;
      final customMetadata = <String, String>{
        'Audio File': downloadURL,
        'Cover Photo': downloadPicURL,
        'Destination': werk.toString(),
        'Pic Destination': work.toString()
      };
      await ref
          .updateMetadata(SettableMetadata(customMetadata: customMetadata));
      return true; // Metadata update successful
    } catch (e) {
      print('Error updating metadata: $e');
      return false; // Metadata update failed
    }
  }
}
