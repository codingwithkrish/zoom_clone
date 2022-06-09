import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/auth_method.dart';
import 'package:zoom_clone/resources/git_c_meet_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../Widgets/meeting_option.dart';

class Videocalss extends StatefulWidget {
  Videocalss({Key? key}) : super(key: key);

  @override
  State<Videocalss> createState() => _VideocalssState();
}

class _VideocalssState extends State<Videocalss> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController c1;
  late TextEditingController c2;
  bool isAudiomuted = true;
  bool isvideomuted = true;
  final JitsMeetmethod _jitsMeetmethod = JitsMeetmethod();

  @override
  void initState() {
    c1 = new TextEditingController();
    c2 = new TextEditingController(text: _authMethods.user.displayName);

    super.initState();
  }

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  void _joinmeeting() {
    try {
      _jitsMeetmethod.createmeeting(
          roomname: c1.text,
          isAudiomuted: isAudiomuted,
          isvideomuted: isvideomuted,
          username: c2.text);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Join a Meeting",
            style: TextStyle(fontSize: 18),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: c1,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room Id',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: c2,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 40,
            child: InkWell(
              onTap: _joinmeeting,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Join',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Meetingoption(
            text: 'Mute Audio',
            ismute: isAudiomuted,
            onchange: isaudioMuted,
          ),
          Meetingoption(
            text: 'Turn off my video',
            ismute: isvideomuted,
            onchange: isVideoMuted,
          ),
        ],
      ),
    );
  }

  isVideoMuted(bool val) {
    setState(() {
      isvideomuted = val;
    });
  }

  isaudioMuted(bool j) {
    setState(() {
      isAudiomuted = j;
    });
  }
}
