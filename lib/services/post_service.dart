import 'package:dio/dio.dart';
import 'package:riverpod_project/utils/constants.dart';
import '../models/post.dart';

class PostService {
  final Dio _dio;

  PostService(this._dio);

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _dio.get('${Constants.baseUrl}posts');
      final data = response.data as List<dynamic>;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<Post> fetchPostDetail(int postId) async {
    try {
      final response = await _dio.get('${Constants.baseUrl}posts/$postId');
      final data = response.data as Map<String, dynamic>;
      return Post.fromJson(data);
    } catch (error) {
      throw Exception('Failed to fetch post detail');
    }
  }
}
