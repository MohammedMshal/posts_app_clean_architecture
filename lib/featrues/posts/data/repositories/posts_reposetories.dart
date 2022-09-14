import 'package:dartz/dartz.dart';
import 'package:postes_app_clean_architecture/core/error/exception.dart';
import 'package:postes_app_clean_architecture/core/error/failures.dart';
import 'package:postes_app_clean_architecture/featrues/posts/data/data_sources/local_data_source/post_local_data_source.dart';
import 'package:postes_app_clean_architecture/featrues/posts/data/data_sources/remot_data_source/post_remote_data_source.dart';
import 'package:postes_app_clean_architecture/featrues/posts/data/models/post_model.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/entities/posts.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/add_post_use_case.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/delete_post_use_case.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/usecases/update_post_use_case.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/posts_ropositories.dart';

class PostsRepositories implements BasePostsRepositories {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetWorkInfo networkInfo;

  PostsRepositories({
    required this.postRemoteDataSource,
    required this.postLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failures, List<Posts>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await postRemoteDataSource.getAllPosts();
        postLocalDataSource.cachePost(result);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await postLocalDataSource.getCachedPosts();
        return Right(result);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failures, Unit>> addPost(
      AddPostParameters addPostParameters) async {
    final post = addPostParameters.posts;
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return _getMassage(() => postRemoteDataSource.addPost(addPostParameters));

  }

  @override
  Future<Either<Failures, Unit>> deletePost(
      DeletePostParameters parameters) async {
    return _getMassage(() => postRemoteDataSource.deletePost(parameters));

  }


  @override
  Future<Either<Failures, Unit>> updatePost(
      UpdatePostParameters updatePostParameters) async {
     return _getMassage(() => postRemoteDataSource.updatePost(updatePostParameters));
  }


  Future<Either<Failures, Unit>> _getMassage(Future<Unit> Function() deleteOrUpdateOrAddPost) async{
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
