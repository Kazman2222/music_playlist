import 'package:audio_playlist/state_management/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class final_home extends StatefulWidget {
  const final_home({super.key});

  @override
  State<final_home> createState() => _final_homeState();
}

class _final_homeState extends State<final_home> {
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

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 32, 32),
        body: Consumer<AudioManagement>(builder: ((context, value, child) {
          return SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, bottom: 10, top: 10),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 71, 224, 76),
                            child:  Text('J',
                                style:  TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)
                                    ),
                            radius: 20,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.menu,
                                color: Colors.white,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                 const   Padding(
                      padding:  EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Listen To Your  ',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22)
                      ),
                    ),
                  const  Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: Text(
                        'Favorite Podcast',
                        style: TextStyle( color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          onSubmitted: (value) {},
                          controller: searchController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.grey,
                              hintText: 'What do you want to listen to...',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const  Text(
                            'Recent search',
                            style:TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                          ),
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
                        margin:
                          const  EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        height: 45,
                        child: Visibility(
                          visible: myList.isEmpty ? false : true,
                          child: Container(
                            height: 0,
                            width: 200,
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
                                            child: Text(
                                              myList[index],
                                              style: const TextStyle(color: Colors.white)
                                            ),
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
                  const  Padding(
                      padding:
                           EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        'Genres',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  backgroundColor: Colors.deepOrange),
                              onPressed: (() {}),
                              child: const Text(
                                'Comedy',
                                style:  TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding:const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  backgroundColor: Colors.deepPurple),
                              onPressed: (() {}),
                              child: const Text(
                                'Health & Wellness',
                                style:TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ))
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  backgroundColor: Colors.red),
                              onPressed: (() {}),
                              child: const Text(
                                'Society',
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  backgroundColor: Colors.green),
                              onPressed: (() {}),
                              child: const Text(
                                'Culture',
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  backgroundColor:
                                      Color.fromARGB(255, 4, 75, 133)),
                              onPressed: (() {}),
                              child:const Text(
                                'Technology',
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ))
                        ],
                      ),
                    ),
                  const  Padding(
                      padding:
                           EdgeInsets.only(left: 20, top: 15, bottom: 10),
                      child:  Text(
                        'Trending',
                        style:  TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      child: Container(
                        height: 150,
                        width: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Container(
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
                                      fit: BoxFit.cover)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                const  Text(
                                    '#Trending',
                                    style:TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                 const Text(
                                    'Analysis on Health Matters',
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 150,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
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
                                        child:const Text('Listening Now',
                                            style:  TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  const  Padding(
                      padding:
                         EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        'Top Podcast',
                        style: TextStyle( color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    Container(
                      height: 170,
                    width: double.infinity,
                      child: Container(
                       
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            height: 170,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 110,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(image: 
                                    NetworkImage('https://media.istockphoto.com/id/1420789680/vector/girl-in-headphones-speaks-into-the-microphone-recording-podcast-in-studio-radio-broadcasting.jpg?s=612x612&w=0&k=20&c=DyUAJFWEBaaTmkhDHJkq4maVoqim1H76ZBQC3zHmN14='),fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(15),
                                      ),
                                ),
                             const   Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text('Brunch-Talk' ,style:TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                                )
                              ],
                            ),
                          );
                        })),
                      ),
                    )
                  ],
                ),
              ));
        })));
  }
}
