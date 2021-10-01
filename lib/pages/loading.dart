import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/quote.dart';
import 'package:flutter_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTimeAndQuote() async {
    WorldTime instance = WorldTime(location: 'Malaysia', flag: 'malaysia.jpg', url: 'Asia/Singapore');
    await instance.getTime();

    // Quote instance2 = Quote(quote: "Never give up work. Work gives you meaning and purpose and life is empty without it.", author: "Stephen Hawking");
    Quote instance2 = Quote();
    await instance2.getQuote();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
      'quote' : instance2.quote,
      'author' : instance2.author,
    });
    // print(instance.time);
    // print(instance2.quote);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTimeAndQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
        body: const Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
