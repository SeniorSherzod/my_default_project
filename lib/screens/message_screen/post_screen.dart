import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/write_chat/create_post_bloc.dart';
import '../../data/chat/models/post.dart';
import '../../data/user/models/my_user_model.dart';

class PostScreen extends StatefulWidget {
  final MyUser myUser;
  const PostScreen(this.myUser, {super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Post post;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if(state is CreatePostSuccess) {
          Navigator.pop(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(_controller.text.length != 0) {
                setState(() {
                  post.post = _controller.text;
                });
                context.read<CreatePostBloc>().add(CreatePost(post));
              }
            },
            child:  const Icon(CupertinoIcons.arrow_up),
          ),
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.white,
            title: const Text(
                'Write Message !'
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                maxLines: null,
                maxLength: 500,
                decoration: InputDecoration(
                  hintText: "Enter Your Post Here...",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}