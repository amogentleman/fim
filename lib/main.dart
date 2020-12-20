import 'dart:io';
import 'package:fim/data/recent_contacts.dart';
import 'package:fim/page/chat/chat_page.dart';
import 'package:fim/page/init_page.dart';
import 'package:fim/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
    ));
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecentContacts()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: backgroundColor,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: backgroundColor,
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black, fontSize: 17),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: (InitPage()),
      routes: {
        '/chatPage': (context) => ChatPage(),
      },
    );
  }
}
