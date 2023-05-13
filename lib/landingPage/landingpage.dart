import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          
         image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://media.istockphoto.com/id/1401141326/photo/a-teenage-boy-walks-through-an-autumn-park-and-listens-to-music-with-headphones-trees-with.jpg?s=612x612&w=0&k=20&c=BF9sKNe0Akpexk8q7W5xL5Bz0F5FERXrw3cNKuxvZv0='),
                  colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.dstATop)
                  
                  ),
                  
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                
               // color: Color.fromARGB(255, 249, 213, 200)
              ),
             
            ),
            const SizedBox(height: 15,),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
              child: Text('Welcome to the best music app ',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 16,height: 2.5,color: Colors.purple),),
            ),
             Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
              child: Text('Looking for where to gain more listeners for your podcast and boost your music? ',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black,letterSpacing: 1.5),),
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,shape: StadiumBorder()),
                    onPressed: (() {
                    
                  }), child: Text('Login',style: GoogleFonts.montserrat(fontSize: 16,color: Colors.white))),
                ),
                SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.purple,)
                    ),
                    onPressed: (() {
                    
                  }), child: Text('Sign Up',style: GoogleFonts.montserrat(fontSize: 16,color: Colors.black))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}