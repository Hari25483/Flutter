import 'dart:collection';
import 'dart:ffi';

import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;
int count = 0;
final ref1 = FirebaseDatabase.instance.ref();
final ref = FirebaseDatabase.instance.ref("$uid_no/English");
SpeechToText _speechToText = SpeechToText();
bool _speechEnabled = false;
String _lastWords = '';
bool recorded_audio = false;
var link = "";
var url = "";

void getLink() async {
  final messages = await _firestore.collection('links').doc('English').get();
  print(messages.data());
  link = messages.data()['url'];
  print(link);
  print(url);
}

Future<void> get_count() async {
  final snapshot = await ref1.child("$uid_no/English/count").get();
  if (snapshot.exists) {
    var val = snapshot.value;
    print(val);
    count = val;
  } else {
    print('No data available.');
  }
}

void get_suggestion(
    String text, String category, String uid_val, int count_val) async {
  await getLink();
  url = '$link' +
      'next_word?word=$text&uid=$uid_val&category=Plant&count=$count_val';
  print(url);
  Response response = await get(Uri.parse(url));
  // '$url_base_path/next_word?word=$text,&uid=$uid_val&category=$category'
  // Await the http get response, then decode the json-formatted response.
  print(response.toString());
  if (response.statusCode == 200) {
    print("Success ");
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class ChatScreen extends StatefulWidget {
  static String id = 'Chat_Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String message;

  Future<void> initState() {
    super.initState();
    getCurrentUser();
    get_count();
    _initSpeech();
    // getMessages();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    recorded_audio = true;
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.uid);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed:
                          // If not yet listening for speech start, otherwise stop
                          _speechToText.isNotListening
                              ? _startListening
                              : _stopListening,
                      tooltip: 'Listen',
                      child: Icon(_speechToText.isNotListening
                          ? Icons.mic_off
                          : Icons.mic),
                    ),
                    Text(
                      //xx If listening is active show the recognized words
                      _speechToText.isListening
                          ? messageTextController.text = _lastWords
                          // If listening isn't active but could be tell the user
                          // how to start it, otherwise indicate that speech
                          // recognition is not yet ready or not supported on
                          // the target device
                          : _speechEnabled
                              ? ''
                              : '',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          message = value;
                          //Do something with the user input.
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (recorded_audio) {
                          message = _lastWords;
                        } else {
                          message = message;
                        }
                        messageTextController.clear();
                        _firestore
                            .collection('messages')
                            .doc(loggedInUser.uid)
                            .collection('Plant')
                            .add({
                          'sender': loggedInUser.email,
                          'text': message,
                          'time': DateTime.now(),
                          'count': count
                        });
                        recorded_audio = false;
                        count++;

                        await get_suggestion(message, 'Plant', uid_no, count);
                        count++;
                        await ref.update({
                          "count": count,
                        });
                        //Implement send functionality.
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .doc(uid_no)
            .collection('Plant')
            .orderBy('count')
            .snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          } else if (snapshot.hasData) {
            final messages = snapshot.data.docs.reversed;
            List<MessageBubble> messageBubbles = [];
            for (var message in messages) {
              final currentUser = loggedInUser.email;
              final messageText = message['text'];
              final messageSender = message['sender'];
              // print(messageText);
              final messageBubble = MessageBubble(
                sender: messageSender,
                text: messageText,
                isMe: currentUser == messageSender,
              );
              messageBubbles.add(messageBubble);
            }

            return Expanded(
                child: ListView(
                    reverse: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageBubbles));
          }
        });
  }
}

class MessageBubble extends StatelessWidget {
  final sender;
  final text;
  final bool isMe;
  MessageBubble({this.sender, this.text, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              sender,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.00),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
