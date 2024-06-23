import 'package:clean_architecture/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required userId, required id, required title, required body})
      : super(
          title: title,
          body: body,
          id: id,
          userId: userId,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: ['userId'],
      id: ['id'],
      title: ['title'],
      body: ['body'],
    );
  }
}
