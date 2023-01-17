import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dev_reddit_test/models/posts.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key, required this.infoPost});
  static const routeName = '/postscreen';

  final ChildrenDataPost infoPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(infoPost.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'UPS : ${infoPost.ups.toString()}',
                  style: const TextStyle(color: Colors.red, fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  infoPost.selftext,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
