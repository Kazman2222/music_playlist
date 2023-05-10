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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://media.istockphoto.com/id/1334828921/photo/facing-back-teenager-high-school-boy-with-headphones-and-backpack-walks-towards-the-school.jpg?s=612x612&w=0&k=20&c=quYwOi_uHC4422-oi2XED3AspPuwvAsgbim9Qu2HIv8='))
               // color: Color.fromARGB(255, 249, 213, 200)
              ),
             
            ),
            const SizedBox(height: 15,),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
              child: Text('Welcome to the best music app ',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 16,height: 2.5),),
            ),
             Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
              child: Text('Looking for where to gain more listeners for your podcast and boost your music? ',style: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 13,color: Color.fromARGB(255, 178, 178, 178),letterSpacing: 1.5),),
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
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    onPressed: (() {
                    
                  }), child: Text('Login',style: GoogleFonts.montserrat(fontSize: 16,color: Colors.white))),
                ),
                SizedBox(
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.purple)
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