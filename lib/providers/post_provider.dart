import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/dio_provider.dart';
import '../models/post.dart';
import '../services/post_service.dart';

final postProvider = FutureProvider<List<Post>>((ref) async {
  final postService = PostService(DioProvider());
  return postService.fetchPosts();
});

final postDetailProvider = FutureProvider.family<Post, int>((ref, postId) async {
  final postService = PostService(DioProvider());
  return postService.fetchPostDetail(postId);
});
