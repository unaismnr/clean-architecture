import 'package:clean_architecture/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEntity>> getAllPostsFromDataSource();
}
