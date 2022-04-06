import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radarsoft/eventList/viewModel/eventViewModel.dart';
import 'package:radarsoft/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => EventViewModel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            toolbarTextStyle: TextStyle(color: Colors.white, fontSize: 14),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.green,
                statusBarBrightness: Brightness.light),
            color: Colors.green,
          ),
        ),
        home: Home(),
      ),
    );
  }
}
