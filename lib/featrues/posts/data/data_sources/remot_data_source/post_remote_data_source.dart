import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:postes_app_clean_architecture/core/error/exception.dart';
import 'package:postes_app_clean_architecture/core/utils/app_string.dart';
import 'package:postes_app_clean_architecture/featrues/posts/data/models/post_model.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/add_post_use_case.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/delete_post_use_case.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/update_post_use_case.dart';

abstract class BasePostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> deletePost(DeletePostParameters parameters);

  Future<Unit> addPost(AddPostParameters parameters);

  Future<Unit> updatePost(UpdatePostParameters parameters);
}

class PostRemoteDataSource implements BasePostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSource({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse(AppString.postsEndPoint),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModel =
      decodedJson.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return postModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(AddPostParameters parameters) async {
    final body = {
      'title': parameters.posts.title,
      'body': parameters.posts.body,
    };
    final response = await client.post(
      Uri.parse(AppString.postsEndPoint),
      body: body,
    );
    if (response.statusCode == 201) {
      return Future.value(unit)
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(DeletePostParameters parameters) async {
    final response = await client.delete(
        Uri.parse(AppString.postsEndPoint + parameters.id.toString(),),
        headers: {
          'Content-Type': 'application/json'
        });
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(UpdatePostParameters parameters) async {
    final body = {
      'title': parameters.posts.title,
      'body': parameters.posts.body,
    };
    final response = await client.patch(
      Uri.parse(AppString.postsEndPoint + parameters.posts.id.toString()),
      body: body,);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
