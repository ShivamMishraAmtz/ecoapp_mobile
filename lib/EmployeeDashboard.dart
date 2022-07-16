import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/Announcement.dart';
import 'package:learning/AppConstant.dart';
import 'package:learning/ChnagePassword.dart';
import 'package:learning/CommanWebView.dart';
import 'package:learning/Company.dart';
import 'package:learning/Complain.dart';
import 'package:learning/DepartmentalComplain.dart';
import 'package:learning/EmployeeCompany.dart';
import 'package:learning/Event.dart';
import 'package:learning/FAQ.dart';
import 'package:learning/Facility.dart';
import 'package:learning/HallBookingForm.dart';
import 'package:learning/Login.dart';
import 'package:learning/MyProfile.dart';
import 'package:learning/VehicleList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainDrawer.dart';

class MyDashboardHomePages extends StatefulWidget {
  final String title;
  final List<dynamic> bannerData = [];
  MyDashboardHomePages({Key? key, required this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyDashboardHomePages> {

  late List<String>? imagesList = [];
  late String banner_url = "";
  String textValue="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Welcome to EcoApp"),
          backgroundColor: Colors.blue,
          actions: <Widget>[],
        ),
        drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 0),
              children: [
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: 304,
                          child: Container(
                              width: double.infinity,
                              height: 250,
                              color: Colors.blue,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage('assets/user.png'),
                                  ),
                                  Text(
                                    textValue.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.0),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      title: Text("Home"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyProfile()),
                        );
                      },
                      leading: Icon(
                        Icons.verified_user_rounded,
                        color: Colors.black,
                      ),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FAQ()),
                        );
                      },
                      leading: Icon(
                        Icons.question_answer,
                        color: Colors.black,
                      ),
                      title: Text("FAQ"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChangePassword()),
                        );
                      },
                      leading: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: Text("Setting"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChangePassword()),
                        );
                      },
                      leading: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      title: Text("Change Password"),
                    ),
                    ListTile(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.clear();

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);


                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => LoginScreen()),
                        // );
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Logout"),
                    )
                  ],
                ),
              ],
            )),
        body: ListView(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        print("Container clicked");
                      },
                      child: Container(

                        height: 200,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          'https://www.amtz.in/static/img/gallery/pivot.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Announcement()),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 112,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.announcement,
                                  color: Colors.blue, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Announcement",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Event()),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.event,
                                  color: Colors.lightBlueAccent, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Events",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Company()),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.house_sharp,
                                  color: Colors.green, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Company",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommanWebView(
                                  title: 'Facilities',
                                  url: Base_url + 'our-center/')),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.connect_without_contact_sharp,
                                  color: Colors.redAccent, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Facility",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FAQ()),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.quickreply,
                                  color: Colors.indigo, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "FAQ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()),
                        );
                      },
                      child: Container(
                          height: 110,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.settings,
                                  color: Colors.pinkAccent, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Setting",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),

                  ],
                ),

              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     new GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => CommanWebView(
                //                   title: 'News',
                //                   url: Base_url + 'news/')),
                //         );
                //       },
                //       child: Container(
                //           height: 120,
                //           width: 120,
                //           child: Card(
                //             child: Padding(
                //               padding: const EdgeInsets.all(25.0),
                //               child: Image.asset('assets/news.png'),
                //             ),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             elevation: 5,
                //             margin: EdgeInsets.all(10),
                //           )),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 0),
                //       child: Text(
                //         "News",
                //         style: TextStyle(
                //             fontSize: 12, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
                //
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     new GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => CommanWebView(
                //                   title: 'Products',
                //                   url: Base_url + 'services/')),
                //         );
                //       },
                //       child: Container(
                //           height: 120,
                //           width: 120,
                //           child: Card(
                //             child: Padding(
                //               padding: const EdgeInsets.all(25.0),
                //               child: Image.asset('assets/cubes.png'),
                //             ),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             elevation: 5,
                //             margin: EdgeInsets.all(10),
                //           )),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left: 0),
                //       child: Text(
                //         "Services",
                //         style: TextStyle(
                //             fontSize: 12, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Complain()),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Icon(Icons.sync_problem_sharp,
                                  color: Colors.pinkAccent, size: 50.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "My Tickets",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>HallBookingForm()),
                        );
                      },
                      child: Container(
                          height: 120,
                          width: 115,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Image.asset('assets/company.png'),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Hall Booking",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),





                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Complain()),
                        );
                      },
                      child: Container(
                        height: 120,
                        width: 112,
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    updateDrawer();
  }

  Future updateDrawer() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('first_name')!+" "+prefs.getString('last_name')!);
    setState((){
      textValue = prefs.getString('first_name')!+" "+prefs.getString('last_name')!;
    });
  }
}
