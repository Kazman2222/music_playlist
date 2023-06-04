import 'package:audio_playlist/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 32),
      body: SafeArea
      (
        top: true,
        child:
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
   children: [
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
           SizedBox(height: 15,),
         Text('Sign Up,',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
          Text('Start Listening',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Login',style: GoogleFonts.inter(color: Color.fromARGB(255, 92, 235, 97),fontWeight: FontWeight.bold,fontSize: 18),),
          Text('Sign up',style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
        ],
      ),
    ),
    const SizedBox(height: 25,),
  Padding(
  padding: const EdgeInsets.only(left: 24,bottom: 5),
  child:   Text('Email Address',style:TextStyle(color: Color.fromARGB(255, 99, 241, 104),fontSize: 14)),
),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            hintText: 'Enter email address',
            hintStyle: TextStyle(color: Colors.white,),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            ),
             enabledBorder: OutlineInputBorder(
              
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            ), focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            )
          ),
          
        ),
      ),
    ),
    const SizedBox(height: 20,),
  const   Padding(
  padding:  EdgeInsets.only(left: 24,bottom: 5),
  child:   Text('password',style: TextStyle(color: Color.fromARGB(255, 99, 241, 104),fontSize: 14,fontWeight: FontWeight.w500),),
),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            hintText: 'Enter password',
            hintStyle: TextStyle(color: Colors.white,),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            ),
             enabledBorder: OutlineInputBorder(
              
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            ), focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
            )
          ),
          
        ),
      ),
    ),
    const SizedBox(height: 48,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Color.fromARGB(255, 57, 213, 63)
          ),
          onPressed: (() {
          
        }), child: const Text('Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),)),
      ),
    ),
    const SizedBox(height: 10,),
   const Center(child: Text('Forgot your password?',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 57, 213, 63),decoration: TextDecoration.underline))),
    const SizedBox(height: 40,),
    Center(
      child: RichText(text: const TextSpan(
        text: 'Dont have an account?',
        style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        children: [
          WidgetSpan(child: SizedBox(width: 5,),
          
          ),
          TextSpan(
            text: 'SIGN UP',
            style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 57, 213, 63))
          )
        ]
      )),
    )
   ],
      ))
    );
  }
}
