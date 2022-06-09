import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/video_calls_screnn.dart';

import '../Widgets/homemetting.dart';
import '../resources/git_c_meet_methods.dart';

class meeting extends StatelessWidget {
  meeting({Key? key}) : super(key: key);
  final JitsMeetmethod _jitsmethods = JitsMeetmethod();
  createNewMeatings() async {
    var random = Random();
    String roomname = (random.nextInt(100000000) + 10000000).toString();

    _jitsmethods.createmeeting(
        roomname: roomname, isAudiomuted: true, isvideomuted: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Homebtni(
              onpressed: createNewMeatings,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            Homebtni(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videocalss()));
              },
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Text(
            'Create /Join Meetings with just a click!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }
}
