import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/Widgets/snak.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  Future<bool> signinEmail(BuildContext context) async {
    bool res = false;
    try {
      GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuthCredential =
          await googleuser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthCredential?.accessToken,
        idToken: googleAuthCredential?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firebaseFirestore.collection('usera').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilephoto': user.photoURL
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnakbar(context, e.toString());
      res = false;
    }
    return res;
  }
}
