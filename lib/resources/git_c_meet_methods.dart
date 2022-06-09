import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/auth_method.dart';
import 'package:zoom_clone/resources/firestor_methods.dart';

class JitsMeetmethod {
  AuthMethods _authmethods = AuthMethods();
  final FirestoreMethods firestoreMethods = FirestoreMethods();
  void createmeeting(
      {required String roomname,
      required bool isAudiomuted,
      required bool isvideomuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username == "") {
        name = _authmethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomname)
        ..userDisplayName = name
        ..userEmail = _authmethods.user.email
        ..userAvatarURL = _authmethods.user.photoURL // or .png

        ..audioMuted = isAudiomuted
        ..videoMuted = isvideomuted;
      firestoreMethods.addToMeeting(roomname, name);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
