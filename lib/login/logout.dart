import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
        elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 32, 32, 32),
        title: const Text('Log Out'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children:  [
           const Text('Are you sure you want to log out?',style: TextStyle(color: Colors.white,fontSize: 19),),
          const   SizedBox(height: 20,),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black
                    ),
                    onPressed: (() {
                    
                  }), child: const Text('Cancel')),
                ),
                const SizedBox(width: 10,),
                   SizedBox(
                  width: 120,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.green
                    ),
                    onPressed: (() {
                    
                  }), child: const Text('Log Out',style: TextStyle(color: Colors.black,fontSize: 20),)),
                ),
              ],
             )
          ],
        ),
      ),
    );
  }
}