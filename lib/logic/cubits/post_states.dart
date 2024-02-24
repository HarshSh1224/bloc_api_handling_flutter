import 'package:bloc_api_handling_flutter/data/models/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostsLoadedState extends PostState {
  final List<Post> posts;
  PostsLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState(this.message);
}