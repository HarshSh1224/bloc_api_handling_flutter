import 'package:bloc_api_handling_flutter/data/models/post_model.dart';
import 'package:bloc_api_handling_flutter/logic/cubits/post_cubit.dart';
import 'package:bloc_api_handling_flutter/logic/cubits/post_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if(state is PostErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.redAccent,));
        }
      },
      builder: (context, state) {
        if(state is PostLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if(state is PostsLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Posts'),
            ),
            body: _postsBody(state)
          );
        }
        if(state is PostErrorState){
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }
        return const Scaffold();
      },
    );
  }

  ListView _postsBody(PostsLoadedState state) {
    return ListView.builder(
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        final Post post = state.posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.userId.toString()),
          leading: CircleAvatar(backgroundColor: post.completed ? Colors.greenAccent : Colors.redAccent),
        );
      }
    );
  }
}