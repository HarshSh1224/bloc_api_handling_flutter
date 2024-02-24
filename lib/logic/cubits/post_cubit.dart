import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_api_handling_flutter/data/repositories/post_repository.dart';
import 'package:bloc_api_handling_flutter/logic/cubits/post_states.dart';
import 'package:dio/dio.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  fetchPosts() async {
    try {
      final posts = await PostRepository.fetchPosts();
      emit(PostsLoadedState(posts));
    } on DioException catch (error) {
      emit(PostErrorState(error.message ?? "Something went wrong!"));
    }
  }
}