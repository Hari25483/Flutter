import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  "images/270042121_4518560931604207_3691290218835539511_n.jpeg"),
            ),
            Text(
              'Hariharan',
              style: TextStyle(
                fontSize: 40.00,
                color: Colors.white,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal[100],
                  fontSize: 25.00,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            Card(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin:
                    EdgeInsets.symmetric(vertical: 10.00, horizontal: 25.00),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10.00,
                    ),
                    Text(
                      "+00 94  771525093",
                      style: TextStyle(
                          fontSize: 20.00,
                          fontFamily: 'Source Sans Pro',
                          color: Colors.teal.shade900),
                    )
                  ],
                )),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.00),
              margin: EdgeInsets.symmetric(vertical: 10.00, horizontal: 25.00),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 10.00,
                  ),
                  Text(
                    "haricodmw@gmail.com",
                    style: TextStyle(
                        fontSize: 20.00,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal.shade900),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
