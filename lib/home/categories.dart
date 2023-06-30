import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class categories extends StatefulWidget {
  const categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 71, 224, 76),
                          child: Text('J',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black)),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    onSubmitted: (value) {},
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
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Last Played From Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
              ),
              Container(
                width: double.infinity,
                child: Container(
                  width: 200,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: Image(
                          height: 140,
                          width: 100,
                            image: NetworkImage(
                                'https://media.istockphoto.com/id/1401291070/vector/jungle-party-poster-with-tropical-leaf-and-vinyl-disc-summer-party-festival-design-template.jpg?s=612x612&w=0&k=20&c=xlwD85v63bLnk4eMA2NwmKtHtbTlBaKrF8RqgVJ_uiU='),fit: BoxFit.cover,),
                      ),
                    );
                  })),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Browse categories',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                       Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1347056983/vector/retro-vinyl-record-concept.jpg?s=612x612&w=0&k=20&c=tL-AJ2Lz-gLoIUfPrD5Y9EOqjvw9wL96ejPqGI_5GI8='),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.bottomRight,
                  child: Text('Comedy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              
                   Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1086397468/vector/black-vinyl-record-disc-flat-concept-vector-illustration.jpg?s=612x612&w=0&k=20&c=IbV_yi5PCR3K2ddfSIvO8vp-OkABa8YhgcYorwoCnhQ='),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.bottomRight,
                  child: Text('Relationship',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                       Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1393787007/vector/sound-waves-dynamic-effect-vector-illustration-with-particle.jpg?s=612x612&w=0&k=20&c=jtkhxIJlW8STlWQUTvGZA7YT8j4LLK756QV6zFS7xCU='),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.bottomRight,
                  child: Text('Entertainment',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              
                   Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1419806047/vector/digital-retro-landscape-1980s-style-futuristic-cyber-surface-80s-retro-sci-fi-background.jpg?s=612x612&w=0&k=20&c=hBF6RM9nMcdYM3shQTVHVMQfRyl1x4wCHU5jIeMio80='),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.bottomRight,
                  child: Text('History',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                       Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1127565686/photo/vintage-vinyl-record-album-cover-mockup-flat-concept.jpg?s=612x612&w=0&k=20&c=F-N_cPFYKXdqE30GGszozhSBoQ0c-mFjX_fZhTCnmlc='),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.bottomRight,
                  child: Text('Origins',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
              
                   Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1419806047/vector/digital-retro-landscape-1980s-style-futuristic-cyber-surface-80s-retro-sci-fi-background.jpg?s=612x612&w=0&k=20&c=hBF6RM9nMcdYM3shQTVHVMQfRyl1x4wCHU5jIeMio80='),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.circular(15)
                  ),
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.bottomRight,
                  child: Text('History',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                  ],
                ),
              ),
              
           
            ],
          ))),
    );
  }
}
