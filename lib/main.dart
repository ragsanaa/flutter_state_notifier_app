import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_notifier/models/api_model.dart';
import 'package:flutter_state_notifier/providers/providers.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postProvider);
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  ref.read(postProvider.notifier).addPost();
                }),
            IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  ref.read(postProvider.notifier).getPosts();
                }),
          ],
        ),
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
                trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(postProvider.notifier).deletePost(post);
                    }),
              );
            }),
      ),
    );
  }
}
