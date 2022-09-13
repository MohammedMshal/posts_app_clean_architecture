import 'package:dartz/dartz.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/entities/posts.dart';

import '../../../../core/error/failures.dart';

abstract class BasePostsRepsitories{
  Future<Either<Failures,List<Posts>>> getAllPosts();
  Future<Either<Failures,Unit>> deletePost(int id);
  Future<Either<Failures,Unit>> updatePost(Posts posts);
  Future<Either<Failures,Unit>> addPost(Posts posts);
}