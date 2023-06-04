import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class adminPanel extends StatefulWidget {
  const adminPanel({super.key});

  @override
  State<adminPanel> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<adminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 32, 32, 32),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
        title: Text('Admin Panel',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.app_registration,color: Colors.green,size: 30,),
                const SizedBox(width: 10,),
                Text('Dashboard',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(color: Colors.white,height: 2,thickness: 1,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.account_box,color: Colors.green,size: 30,),
                const SizedBox(width: 10,),
                Text('Manage Podcast',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],
            ),
          ),
        const  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(color: Colors.white,height: 2,thickness: 1,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.add,color: Colors.green,size: 30,),
                const SizedBox(width: 10,),
                Text('Add New Podcast',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],
            ),
          ),
       const   Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(color: Colors.white,height: 2,thickness: 1,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.graphic_eq,color: Colors.green,size: 30,),
                const SizedBox(width: 10,),
                Text('Analytics',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),)
              ],
            ),
          ),
        const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(color: Colors.white,height: 2,thickness: 1,),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.settings,color: Colors.green,size: 30,),
                 SizedBox(width: 10,),
                Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),)
              ],
            ),
          ),
        const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(color: Colors.white,height: 2,thickness: 1,),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.logout,color: Colors.green,size: 30,),
                 SizedBox(width: 10,),
                Text('Log-Out',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),)
              ],
            ),
          ),
        const  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(color: Colors.white,height: 2,thickness: 1,),
          )
        ],
      ),
    );
  }
}