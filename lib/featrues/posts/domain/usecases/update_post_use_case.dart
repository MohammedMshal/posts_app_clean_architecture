import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:postes_app_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:postes_app_clean_architecture/core/error/failures.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/entities/posts.dart';

import '../repositories/posts_ropositories.dart';

class UpdatePostUseCase extends BaseUseCase<Unit, UpdatePostParameters> {
  final BasePostsRepositories basePostsRepositories;

  UpdatePostUseCase(this.basePostsRepositories);
  @override
  Future<Either<Failures, Unit>> call(UpdatePostParameters parameters) async{
    return await basePostsRepositories.updatePost(parameters);
  }
}

class UpdatePostParameters extends Equatable {
  final Posts posts;

  const UpdatePostParameters(this.posts);

  @override
  List<Object> get props => [posts];
}
