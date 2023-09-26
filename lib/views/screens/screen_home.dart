import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/views/layouts/layout_home_page.dart';
import 'package:notesapp/views/layouts/layout_profile.dart';
import 'package:notesapp/views/screens/screen_add_notes.dart';
import 'package:notesapp/views/screens/screen_start_home.dart';

class ScreenHome extends StatefulWidget {

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int currentTab = 0;

  final List<Widget> Screens= [

    LayoutHomePage(),
    LayoutProfile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen =LayoutHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6A3EA1),

        onPressed: (){
          Get.to(ScreenAddNotes());
        },
        child: Icon(Icons.add, size: 32, color: Colors.white,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 84,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:15, bottom:10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   MaterialButton(
                       height: 70,
                       onPressed: (){
                         setState(() {
                           currentScreen = LayoutHomePage();
                           currentTab = 0;
                         });
                       },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(

                             Icons.home,
                           color: currentTab == 0 ? Color(0xFF6A3EA1) : Colors.grey,
                           size: 40,
                         ),
                         Text('Home',
                         style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                           color: currentTab == 0 ? Color(0xFF6A3EA1) : Colors.grey,
                         ),
                         )
                       ],
                     ),
                       ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right:15, bottom:10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   MaterialButton(
                       height: 70,
                       onPressed: (){
                         setState(() {
                           currentScreen = LayoutProfile();
                           currentTab = 1;
                         });
                       },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(

                             Icons.person_2,
                           color: currentTab == 1 ? Color(0xFF6A3EA1) : Colors.grey,
                           size: 40,
                         ),
                         Text('Profile',
                         style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                           color: currentTab == 1 ? Color(0xFF6A3EA1) : Colors.grey,
                         ),
                         )
                       ],
                     ),
                       ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
