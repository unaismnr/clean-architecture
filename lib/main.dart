import 'package:clean_architecture/application/screens/posts/post_bloc/post_bloc.dart';
import 'package:clean_architecture/application/screens/posts/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        title: 'Clean Arch',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: false,
        ),
        home: const PostPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
