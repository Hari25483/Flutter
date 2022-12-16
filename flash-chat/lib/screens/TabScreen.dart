import 'package:flash_chat/screens/chat_screen_pesticide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  // _auth.signOut();
                  Navigator.pop(context);
                  //Implement logout functionality
                }),
          ],
          title: Text('⚡CropAdvisor'),
          backgroundColor: Colors.lightBlueAccent,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'English',
              ),
              Tab(
                text: 'Tamil',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [ChatScreen(), ChatScreen_Tamil()],
        ),
      ),
    );
  }
}
