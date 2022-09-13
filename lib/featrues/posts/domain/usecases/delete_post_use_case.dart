import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:postes_app_clean_architecture/core/base_use_case/base_use_case.dart';
import 'package:postes_app_clean_architecture/core/error/failures.dart';
import 'package:postes_app_clean_architecture/featrues/posts/domain/repositories/posts_ropositories.dart';

class DeletePostUseCase extends BaseUseCase<Unit,DeletePostParameters>{
  final BasePostsRepositories basePostsRepositories;

  DeletePostUseCase(this.basePostsRepositories);

  @override
  Future<Either<Failures, Unit>> call(DeletePostParameters parameters) async{
    return await basePostsRepositories.deletePost(parameters);
  }

}

class DeletePostParameters extends Equatable {
  final int id;

  const DeletePostParameters(this.id);

  @override
  List<Object> get props => [id];
}