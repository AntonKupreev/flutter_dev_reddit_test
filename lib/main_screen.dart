import 'package:flutter/material.dart';

import 'package:flutter_dev_reddit_test/models/posts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main screen"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder<List<ChildrenPost>>(
          future: getDataPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      onTap: () {
                        Navigator.pushNamed(context, '/postscreen',
                            arguments: snapshot.data![index].data);
                      },
                      title: snapshot.data![index].data.thumbnail
                              .startsWith('http')
                          ? Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  snapshot.data![index].data.thumbnail),
                            )
                          : const Text(''),
                      subtitle: Text(snapshot.data![index].data.title),
                    ),
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
