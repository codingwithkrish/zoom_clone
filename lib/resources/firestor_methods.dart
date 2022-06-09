import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void addToMeeting(String meetingname, String name) async {
    try {
      await _firestore
          .collection('usersonmeeting')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingname,
        'creatwdat': DateTime.now(),
        'name': name
      });
    } catch (e) {}
  }
}
