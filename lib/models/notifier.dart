import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_notifier/models/api_model.dart';
import 'package:dio/dio.dart';

class DataNotifier extends StateNotifier<List<Post>> {
  DataNotifier() : super([]);

  void addPost() => state = [
        Post(userId: 1, id: 200, title: 'title', body: 'body'),
        ...state
      ];
  void deletePost(Post post) {
    state = state.where((element) => element.id != post.id).toList();
  }

  Future<void> getPosts() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      final data = response.data as List;
      state = data.map((e) => Post.fromJson(e)).toList();
    }
  }
}
