import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/login_screen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String url;
  @override
  void initState() {
    url = _auth.currentUser!.photoURL!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              url,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 20,
            color: Color.fromARGB(126, 0, 0, 0),
            child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Name  ",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Text(
                          "${_auth.currentUser?.displayName}",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 20,
            color: Color.fromARGB(126, 0, 0, 0),
            child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Email  ",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Text(
                          "${_auth.currentUser?.email}",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              _auth.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 20,
                color: Color.fromARGB(126, 0, 0, 0),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
