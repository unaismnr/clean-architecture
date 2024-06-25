import 'package:clean_architecture/data/repositories/post_repo_impl.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';

class PostUseCases {
  Future<List<PostEntity>> getAllPostsFromDataSource() async {
    final postRepo = PostRepoImpl();

    final posts = await postRepo.getAllPostsFromDataSource();
    return posts;
  }
}
