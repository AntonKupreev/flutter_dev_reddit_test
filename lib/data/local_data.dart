import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dev_reddit_test/models/posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  /// Gets the cached [List<PersonModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<PostPreview>? getLastPostFromCache();
  Future<void> postToCache(PostPreview post);
}

const CACHED_POST_LIST = 'CACHED_POST_LIST';

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PostPreview>? getLastPostFromCache() {
    final jsonPostList = sharedPreferences.getString(CACHED_POST_LIST);
    if (jsonPostList!.isNotEmpty) {
      print('Get posts from Cache: ${jsonPostList.length}');
      return Future.value(
        PostPreview.fromJson(json.decode(jsonPostList)),
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> postToCache(PostPreview post) {
    sharedPreferences.setString(CACHED_POST_LIST, json.encode(post.toJson()));
    // print('Persons to write Cache: ${jsonPostList.length}');
    return Future.value();
  }
}
