import 'package:dartz/dartz.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/entities/posts.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/add_post_use_case.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/delete_post_use_case.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/update_post_use_case.dart';

import '../../../../core/error/failures.dart';

abstract class BasePostsRepositories{
  Future<Either<Failures,List<Posts>>> getAllPosts();
  Future<Either<Failures,Unit>> deletePost(DeletePostParameters parameters);
  Future<Either<Failures,Unit>> updatePost(UpdatePostParameters updatePostParameters);
  Future<Either<Failures,Unit>> addPost(AddPostParameters addPostParameters);
}

