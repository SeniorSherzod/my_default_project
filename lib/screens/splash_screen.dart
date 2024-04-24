import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/tabbox/tabbox.dart';
import 'package:my_default_project/screens/widgets/drawer.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../utils/images/app_images.dart';

class ResumeScreen extends StatelessWidget {
   ResumeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child:SizedBox(
                      width:300,child: Image.asset(AppImages.men,fit: BoxFit.fill,))
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                children: [
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sherzod Qulmurodov',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Flutter Developer\n'
                            'Graphic Designer\n'
                            'Visual communicator',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              // Experience Section
              const Text(
                'Experience',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                '+2 years experience', // Placeholder, replace with actual experience details
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),

              // Contact Section
              const SizedBox(height: 20.0),
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10.0),
                  Text(
                    '+998 93 636 99 11', // Placeholder, replace with your phone number
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(Icons.place),
                  SizedBox(width: 10.0),
                  Text(
                    'Chilonzor-17 Tashkent', // Placeholder, replace with your location
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // InkWell(
          //   onTap: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumeScreen()));
          //   },
          //   child: Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: AppColors.pink1,
          //       border: Border.all(
          //         color: Colors.white,
          //         width: 2.0,
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           blurRadius: 7,
          //           offset: const Offset(0, 3), // This controls the shadow direction (x, y)
          //         ),
          //       ],
          //     ),
          //     child: Center(child: SvgPicture.asset(AppImages.back)),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigatorScreen()));
            },
            child: Container(
              width: 220,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.c_F8A44C,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "More",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //    Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomNavigatorScreen()));
          //   },
          //   child: Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: AppColors.pink1,
          //       border: Border.all(
          //         color: Colors.white,
          //         width: 2.0,
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           blurRadius: 7,
          //           offset: const Offset(0, 3),
          //         ),
          //       ],
          //     ),
          //     child: Center(child: SvgPicture.asset(AppImages.forward)),
          //   ),
          // ),
        ],
      ),
    );
  }
}
