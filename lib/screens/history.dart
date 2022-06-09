import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestor_methods.dart';

class HistoryMeet extends StatelessWidget {
  HistoryMeet({Key? key}) : super(key: key);
  final FirestoreMethods firestoreMethods = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('usersonmeeting')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('meetings')
            .snapshots(),
        builder: (context, snapsshot) {
          if (snapsshot.connectionState == ConnectionState.waiting) {
            return Container(
              alignment: Alignment.center,
              child: Text("Loading"),
            );
          } else {
            final kkk = (snapsshot.data! as dynamic).docs;
            return ListView.builder(
                itemCount: kkk.length,
                itemBuilder: (context, index) {
                  var time = (kkk[index]['creatwdat'] as Timestamp).toDate();
                  return Container(
                    height: 80,
                    child: Card(
                      elevation: 20,
                      color: Color.fromARGB(126, 0, 0, 0),
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      "Room No - ${kkk[index]['meetingName']}"),
                                  Text(
                                      "Joined at ${DateFormat.yMd().add_jm().format(time)}")
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Joined as ${kkk[index]["name"]}")
                            ],
                          )),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  );
                });
          }
        },
      )),
    );
  }
}
