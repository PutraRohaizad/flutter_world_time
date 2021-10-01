import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String quote = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    
    Map dataMap =  ModalRoute.of(context)!.settings.arguments as Map;
    data = data.isNotEmpty ? data : dataMap;

    quote = dataMap['quote'];
    author = dataMap['author'];

    String bgImg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgClr = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgClr,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImg'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(children: <Widget>[
            TextButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDayTime': result['isDayTime'],
                    'flag': result['flag'],
                  };
                });
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[300],
              ),
              label: Text(
                'Edit Location',
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              margin: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${data['location']!} - ",
                        style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 3.0,
                            color: Colors.blue[400]
                            ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0, 
                            color: Colors.black
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              color: Colors.black12,
              margin: EdgeInsets.all(30.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Quote of the day : ",
                      style: TextStyle(
                        fontSize: 20.0, 
                        color: Colors.white),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '"$quote"',
                      style: TextStyle(
                        fontSize: 12.0, 
                        color: Colors.white,
                        letterSpacing: 3.0
                        ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '- $author -',
                      style: TextStyle(
                        fontSize: 12.0, 
                        color: Colors.white,
                        letterSpacing: 3.0
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'World Time',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'TBA',
            backgroundColor: Colors.black,
          ),
       
        ],
      ),
    );
  }
}
