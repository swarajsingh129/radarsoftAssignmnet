import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radarsoft/constants.dart';
import 'package:radarsoft/eventList/model/eventModel.dart';

class EventServices {
  static Future<dynamic> getEvents() async {
    try {
      final url = Uri.parse(urlLink);
      final headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        "userId": "1"
      };

      final response = await http.post(
        url,
        headers: headers,
        encoding: Encoding.getByName('utf-8'),
      );
   
      if (response.statusCode == 200) {
       
        return allEventModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
