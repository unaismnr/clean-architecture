import 'package:clean_architecture/application/screens/posts/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(
          const PostEvent.fecthPosts(),
        );
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is Loaded) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 0, 98, 179),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text('${index + 1}'),
                            ),
                            title: Text(
                              post.title,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              post.body,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: 10,
                    ),
                  );
                } else if (state is Error) {
                  return const Center(
                    child: Text('No Data Fetched'),
                  );
                }
                return const Center(
                  child: Text('Refresh to Load'),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PostBloc>().add(
                      const PostEvent.fecthPosts(),
                    );
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
              ),
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
