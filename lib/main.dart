// import 'dart:convert';
import 'dart:math';
import 'package:fangram/Pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/ProfileViewPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FanGram());
}

class FanGram extends StatefulWidget {
  const FanGram({super.key});

  @override
  State<FanGram> createState() => _FanGramState();
}

class _FanGramState extends State<FanGram> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Welcome to FanGram",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//
//
//
class _HomePageState extends State<HomePage> {
  int Ranindex = 0;
  //
  // List<Color> _color = [Colors.black, Colors.black, Colors.black];
  static var myStyle = const TextStyle(fontSize: 14);
  List<Widget> WidgetItems = <Widget>[
    Text("Home", style: TextStyle(fontSize: 14)),
    Text("Inbox", style: myStyle),
    Text("Following"),
    Text("Profile"),
  ];
  //
  int _selectedIndex = 0;
  //
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Random random = Random();
    Ranindex = random.nextInt(10);
  }

  findProfession(int index, String str) {
    if (person["profession"][index] == str) {
      String selectedPerson = person["name"][index].toString();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.8,
            height: MediaQuery.of(context).size.height / 3.1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assest/${index + 1}.jpg",
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 05),
          Text(
            selectedPerson.toString(),
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(height: 05),
          Text(
            person["profession"][index],
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 126, 121, 121)),
          ),
          SizedBox(height: 05),
          Text(
            "Rs " + person["cost"][index],
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 249, 249, 249)),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

//
  Map<String, dynamic> person = {
    "name": [
      "Anmol KC",
      "Keki Adhikari",
      "Pradeep Khadka",
      "Shrishti Shrestha",
      "Sushant KC",
      "Priyanka Karki",
      "Sajjan Raj Vaidya",
      "Shrinkhala Khatiwada",
      "Rajesh Hamal",
      "Aanchal Sharma",
      "Toshima Karki"
    ],
    //
    "profession": [
      "Actor",
      "Actor",
      "Actor",
      "Actor",
      "Musician",
      "Actor",
      "Musician",
      "Miss World ",
      "Actor",
      "Actor",
      "Politician"
    ],
    "cost": [
      "30k+",
      "35k+",
      "40k+",
      "40k+",
      "30k+",
      "35k+",
      "40k+",
      "40k+",
      "50k+",
      "20k+",
      "25k+"
    ],
    "av_time": [
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
      "24hr",
    ]
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 11, 11),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              iconSize: 30,
              color: Color.fromARGB(255, 255, 255, 255),
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "FanGram",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 35,
                      color: Colors.white,
                      icon: Icon(Icons.cancel),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.video_call, size: 35),
                          SizedBox(width: 10),
                          Text(
                            "All Orders",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.cyan,
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          'Settings',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          // Handle drawer item tap
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text(
                          'Apply to be taken',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          // Handle drawer item tap
                        },
                      ),
                      ListTile(
                        //
                        leading: Icon(Icons.logout),
                        title: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          // Handle drawer item tap
                        },
                      ),
                      SizedBox(height: 30),
                      Text("Version 1.1.0", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Personalized videos from your favorite stars",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CupertinoSearchTextField(
                  itemColor: Color.fromARGB(255, 255, 255, 255),
                  placeholder: "Try " + "'" + person["name"][Ranindex] + "'",
                  backgroundColor: Color.fromARGB(60, 114, 111, 111),
                  borderRadius: BorderRadius.circular(20),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon: Icon(Icons.cancel),
                ),
              ),
              SingleChildScrollView(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Text(
                        "Trending",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Sans-serif",
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: ListView.builder(
                        itemCount: person["name"].length,
                        padding:
                            EdgeInsets.symmetric(vertical: 01, horizontal: 4.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfileView(
                                  person: person,
                                  index: index,
                                );
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 06, vertical: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 200,
                                    width:
                                        MediaQuery.of(context).size.width / 1.8,
                                    height: MediaQuery.of(context).size.height /
                                        3.1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assest/${index + 1}.jpg",
                                        fit: BoxFit.cover,
                                        // height: 100,
                                        // width: 100,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    person["name"][index],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 04),
                                  Text(
                                    person["profession"][index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 126, 121, 121)),
                                  ),
                                  SizedBox(height: 04),
                                  Text(
                                    "Rs " + person["cost"][index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 249, 249, 249)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    __buildWidget("Actor"),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.3,
                      // width: MediaQuery.of(context).size.width / 1.8,
                      // height: MediaQuery.of(context).size.height / 3.1,
                      child: ListView.builder(
                        itemCount: person["name"].length,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 4.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                findProfession(index, "Actor"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    __buildWidget("Musician"),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: ListView.builder(
                        itemCount: person["name"].length,
                        // itemCount: 2,
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 04.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                findProfession(index, "Musician"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.inbox_rounded),
            //   label: 'Inbox',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Following',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget __buildWidget(String _profession) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 02, horizontal: 8.0),
      child: Text(
        _profession,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Sans-serif",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
