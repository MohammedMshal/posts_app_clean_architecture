import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:postes_app_clean_architecture/core/error/exception.dart';
import 'package:postes_app_clean_architecture/core/utils/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/post_model.dart';



abstract class BasePostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();

  Future<Unit> cachePost(List<PostModel> postModels);
}

class PostLocalDataSource implements BasePostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSource({required this.sharedPreferences});

  @override
  Future<Unit> cachePost(List<PostModel> postModels) {
    List postModelToJson = postModels.map<Map<String, dynamic>>((e) =>
        e.toJson()).toList();
    sharedPreferences.setString(AppString.cachePosts, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(AppString.cachePosts);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonData.map<PostModel>((e) =>
          PostModel.fromJson(e)).toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException();
    }
  }
}