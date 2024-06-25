import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/usecases/post_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const Initial()) {
    on<_FecthPosts>((event, emit) async {
      emit(const PostState.loading());

      try {
        final posts = await PostUseCases().getAllPostsFromDataSource();
        emit(PostState.loaded(posts));
      } catch (e) {
        emit(PostState.error(e.toString()));
      }
    });
  }
}
