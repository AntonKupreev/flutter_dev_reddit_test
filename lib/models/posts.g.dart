// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      (json['children'] as List<dynamic>)
          .map((e) => ChildrenPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'children': instance.children.map((e) => e.toJson()).toList(),
    };

ChildrenPost _$ChildrenPostFromJson(Map<String, dynamic> json) => ChildrenPost(
      ChildrenDataPost.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildrenPostToJson(ChildrenPost instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

ChildrenDataPost _$ChildrenDataPostFromJson(Map<String, dynamic> json) =>
    ChildrenDataPost(
      json['title'] as String,
      json['thumbnail'] as String,
      json['ups'] as int,
      json['selftext'] as String,
    );

Map<String, dynamic> _$ChildrenDataPostToJson(ChildrenDataPost instance) =>
    <String, dynamic>{
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'ups': instance.ups,
      'selftext': instance.selftext,
    };

PostPreview _$PostPreviewFromJson(Map<String, dynamic> json) => PostPreview(
      PostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostPreviewToJson(PostPreview instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };
