import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:postes_app_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:postes_app_clean_architecture/core/error/failures.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/entities/posts.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/repositories/posts_ropositories.dart';

class GetAllPostsUseCase extends BaseUseCase<List<Posts>,NoParameters>{
  final BasePostsRepositories basePostsRepositories;

  GetAllPostsUseCase(this.basePostsRepositories);

  @override
  Future<Either<Failures, List<Posts>>> call(NoParameters parameters) async{
    return await basePostsRepositories.getAllPosts();
  }

}