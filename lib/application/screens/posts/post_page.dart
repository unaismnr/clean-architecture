import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
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
                      title: const Text(
                        'Post Title',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text(
                        'Post Sub Title',
                        style: TextStyle(
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
            ),
            ElevatedButton(
              onPressed: () {},
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
