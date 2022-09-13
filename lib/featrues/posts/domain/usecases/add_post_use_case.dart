import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:postes_app_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:postes_app_clean_architecture/core/error/failures.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/entities/posts.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/repositories/posts_ropositories.dart';

class AddPostsUseCase extends BaseUseCase<Unit, AddPostParameters> {
  final BasePostsRepositories basePostsRepositories;

  AddPostsUseCase(this.basePostsRepositories);

  @override
  Future<Either<Failures, Unit>> call(AddPostParameters parameters) async {
    return await basePostsRepositories.addPost(parameters);
  }

}

class AddPostParameters extends Equatable {
  final Posts posts;

  const AddPostParameters(this.posts);

  @override
  List<Object> get props => [posts];
}