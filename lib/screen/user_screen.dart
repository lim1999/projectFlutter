import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat/widget/CustomTextIcon.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("User Screen"),
      ),
      body: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data;

          return StreamBuilder(
            stream: Firestore.instance.collection('users').snapshots(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final user = userSnapshot.data.documents;
              return Container(
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: user.length,
                  itemBuilder: (ctx, index) {
                    return user[index]['userId'] == data.uid
                        ? Column(
                            children: [
                              Image.network(
                                user[index]['image_url'],
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                              CustomTextIcon(
                                icons: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                ),
                                label: "UserName:",
                                showText: user[index]['username'],
                              ),
                              CustomTextIcon(
                                icons: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                label: "Email:",
                                showText: user[index]['email'],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                },
                                child: Text("LogOut"),
                              )
                            ],
                          )
                        : Container();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
