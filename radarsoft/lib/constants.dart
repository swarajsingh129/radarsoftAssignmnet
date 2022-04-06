import 'package:flutter/material.dart';

String urlLink = "https://organizergathrr.radarsofttech.in/api/getallevent";

Color white = Colors.white;
Color black = Colors.black;
Color yellow = Colors.amber;
Color blue = Colors.blue;
Color green = Colors.green;
Color orange = Color.fromARGB(255, 255, 95, 2);
Color red = Colors.red;

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

navigate(BuildContext context, dynamic page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}

showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
