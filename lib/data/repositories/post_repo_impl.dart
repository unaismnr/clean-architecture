import 'package:clean_architecture/data/datasources/post_remote_datasource.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/post_repo.dart';

class PostRepoImpl extends PostRepo {
  final postRemoteData = PostRemoteDataSourceImpl();

  @override
  Future<List<PostEntity>> getAllPostsFromDataSource() async {
    final posts = await postRemoteData.getPostFromApi();
    return posts;
  }
}
