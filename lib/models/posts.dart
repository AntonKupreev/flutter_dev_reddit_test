import 'dart:convert';

import 'package:flutter_dev_reddit_test/data/local_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'posts.g.dart';

@JsonSerializable(explicitToJson: true)
class PostData {
  final List<ChildrenPost> children;

  PostData(this.children);

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChildrenPost {
  final ChildrenDataPost data;

  ChildrenPost(this.data);
  factory ChildrenPost.fromJson(Map<String, dynamic> json) =>
      _$ChildrenPostFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenPostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChildrenDataPost {
  final String title;
  final String thumbnail;
  final int ups;
  final String selftext;

  ChildrenDataPost(this.title, this.thumbnail, this.ups, this.selftext);

  factory ChildrenDataPost.fromJson(Map<String, dynamic> json) =>
      _$ChildrenDataPostFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenDataPostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostPreview {
  final PostData data;

  PostPreview(this.data);
  factory PostPreview.fromJson(Map<String, dynamic> json) =>
      _$PostPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$PostPreviewToJson(this);
}

Future<List<ChildrenPost>> getDataPosts() async {
  //Future <List<HotelPreview>> hotelslist;
  final prefs = await SharedPreferences.getInstance();
  final cache = PostLocalDataSourceImpl(sharedPreferences: prefs);
  const url = 'https://reddit.com/r/flutterdev/new.json';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<ChildrenPost> postsList = [];
      final postsListJson = json.decode(response.body);
      //print(postsListJson);

      final a = PostPreview.fromJson(postsListJson).data.children;
      await cache.postToCache(PostPreview.fromJson(postsListJson));
      return a;
    } else {
      final dataFromCache = await cache.getLastPostFromCache();
      if (dataFromCache == null) {
        throw Exception('Error ${response.reasonPhrase}');
      }
      return dataFromCache.data.children;
    }
  } catch (e) {
    final dataFromCache = await cache.getLastPostFromCache();
    if (dataFromCache == null) {
      throw Exception('Error: not cache files');
    }
    return dataFromCache.data.children;
  }
}
