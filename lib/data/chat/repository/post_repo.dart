
import '../models/post.dart';

abstract interface class PostRepository {

  Future<Post> createPost(Post post);

  Future<List<Post>> getPost();

}