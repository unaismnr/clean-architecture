import 'dart:convert';

import 'package:clean_architecture/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPostFromApi();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getPostFromApi() async {
    try {
      final res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (res.statusCode == 200) {
        final List<dynamic> parsed = jsonDecode(res.body);
        final posts = parsed
            .map(
              (post) => PostModel.fromJson(post as Map<String, dynamic>),
            )
            .toList();
        return posts;
      } else {
        throw Exception('Failed to Load Posts from Api');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
