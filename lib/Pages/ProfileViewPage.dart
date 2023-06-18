import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.person, required this.index});
  final Map<String, dynamic> person;
  final int index;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  //Logic goes here
  late VideoPlayerController _controller;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  //
  int followers = 0;
  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton.filled(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              backgroundColor: Colors.black,
              // title: Text("Hello"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    color: Color.fromARGB(255, 44, 43, 43),
                    child: Text(
                      "Follow",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        followers++;
                      });
                    },
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(CupertinoIcons.share)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                ],
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      height: MediaQuery.of(context).size.height / 2.40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 06.0),
                                  width: 280,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    },
                                    icon: Icon(
                                      _controller.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 40,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    )),
                              ],
                            );
                          }),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              child: Text(
                                widget.person["name"][widget.index],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              child: Text(
                                widget.person["profession"][widget.index],
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              child: Text(
                                widget.person["cost"][widget.index],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(
                                        255, 215, 209, 209)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              child: Row(
                                children: [
                                  Icon(Icons.event_available),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.person["av_time"][widget.index],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.pink,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage("assest/${widget.index + 1}.jpg"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome to my official profile! I'm Anmol, Actor and I'm thrilled to connect with all my amazing fans here. With a passion for mention key interests or talentsI've had the incredible opportunity to [highlight notable achievements or experiences]. From [mention any major projects or collaborations] to [highlight other significant accomplishments], my journey has been nothing short of extraordinary",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Arial",
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white70),
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: 4),
                                Text("5.0"),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Followers",
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 4),
                                Text(followers.toString()),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    //
                    //your code goes here
                    //
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          );
  }
}
