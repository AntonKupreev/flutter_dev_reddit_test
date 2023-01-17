import 'package:flutter/material.dart';
import 'package:flutter_dev_reddit_test/main_screen.dart';
import 'package:flutter_dev_reddit_test/models/posts.dart';
import 'package:flutter_dev_reddit_test/post_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MainScreen.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const MainScreen();
              },
            );
          case PostScreen.routeName:
            final postInfo = settings.arguments as ChildrenDataPost;
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return PostScreen(
                  infoPost: postInfo,
                );
              },
            );
        }
      },
    );
  }
}
