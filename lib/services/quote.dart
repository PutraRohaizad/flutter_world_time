import 'package:http/http.dart';
import 'dart:convert';

class Quote {
  String? quote;
  String time = '';
  String? author;
  // String url;
  // bool isDayTime = true;

  Quote({ this.quote,  this.author});

  Future<void> getQuote() async {
    try {
      Response res = await get(Uri.parse('https://quotes.rest/qod'));
      Map data = jsonDecode(res.body);
      // print('quote');
      // print(data['contents']['quotes'][0]['author']);
      quote = data['contents']['quotes'][0]['quote'];
      author = data['contents']['quotes'][0]['author'];
     
    } catch (e) {
      print(e);
    }
  }
}
