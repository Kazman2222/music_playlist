import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class profile_information extends StatefulWidget {
  const profile_information({super.key});

  @override
  State<profile_information> createState() => _profile_informationState();
}

class _profile_informationState extends State<profile_information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff212121),
        appBar: AppBar(
          backgroundColor: Color(0xff212121),
          leading: Icon(Icons.arrow_back_ios),
          title: const Text(
            'Nicki minaj',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('registraton')
              .where('id', isEqualTo: 'kazeemquayum67@gmail.com')
              .snapshots(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
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
                              borderRadius: BorderRadius.circular(15),
                              child: const Image(
                                height: 200,
                                width: double.infinity,
                                image: NetworkImage(
                                  'data:image/jpeg;base64,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',
                                ),
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            documentSnapshot['firstname'] +
                                ' ' +
                                documentSnapshot['lastname'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "a.k.a",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  children: [
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: 5,
                                      ),
                                    ),
                                    TextSpan(
                                        text: documentSnapshot['stagename'],
                                        style: TextStyle(
                                            decorationColor: Color.fromARGB(
                                                255, 57, 213, 63),
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 57, 213, 63)))
                                  ],
                                ),
                              ),
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: (() {}),
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Follow',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                          const Text(
                            'Latest',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Popular',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    '6,500,000',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text('Monthly Listeneres',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    '500,000',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text('Followers',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Nicki Minaj, original name Onika Tanya Maraj, (born December 8, 1982, St. James, Trinidad and Tobago), Trinidadian-born singer, songwriter, television personality, and actress who was known for her flowing quick-spoken rap style and for her provocative lyrics. She complemented her music with a bold persona that included colourful wigs and risqué clothing.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 2),
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
                              const Text(
                                'Nationality',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(documentSnapshot['nationality'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green))
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(documentSnapshot['gender'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Date of birth',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text('08-08-1992',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green))
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('No Information found'),
              );
            }
          }),
        ));
  }
}
