import 'package:dio/dio.dart';
import 'package:flutter_state_notifier/models/api_model.dart';

Future<List<Post>> getPosts() async {
  final response =
      await Dio().get('https://jsonplaceholder.typicode.com/posts');
  final data = response.data as List;
  return data.map((e) => Post.fromJson(e)).toList();
}
