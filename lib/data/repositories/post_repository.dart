
import 'package:bloc_api_handling_flutter/data/models/post_model.dart';
import 'package:bloc_api_handling_flutter/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository{
  static Api api = Api(); 
  static Future<List<Post>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/todos");
      List<dynamic> responseData = response.data;
      return responseData.map((postMap) => Post.fromMap(postMap)).toList();
    } catch(ex) {
      rethrow;
    }
  }
}