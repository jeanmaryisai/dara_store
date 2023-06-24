import 'package:dara_store/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'components/data.dart';
import 'models/Product.dart';
import 'models/chat.dart';
import 'models/comment.dart';
import 'models/message.dart';
import 'models/post.dart';

User? getUserByName(String name) {
  for (var element in users) {
    if (element.username == name) {
      return element;
    }
  }
  return null;
}

Product? getProductByTitle(String caption) {
  return products.firstWhere((element) => element.description == caption);
}

void addCommentToPost(String caption, Post post) {
  Comment comment = Comment(
    author: currentUser,
    post: post,
    comment: caption,
    created: DateTime.now(),
  );
  comments.add(comment);
  Fluttertoast.showToast(msg: 'Posted');
}

Map<String, bool> getFollowerInfo(User me, User you) {
  Map<String, bool> map = {
    'iFollow': false,
    'youFollow': false,
  };
  followersGenerale.forEach((element) {
    if (element.first.id == me.id && element.followedBack.id == you.id) {
      map['iFollow'] = true;
      element.isFollowBack ? map['youFollow'] = true : map['youFollow'] = false;
    }
    if (element.first.id == you.id && element.followedBack.id == me.id) {
      map['youFollow'] = true;
      element.isFollowBack ? map['iFollow'] = true : map['iFollow'] = false;
    }
  });
  return map;
}

List<User> getFollowers(User user) {
  List<User> follower = [];
  users.forEach((element) {
    getFollowerInfo(user, element)['youFollow']! ? follower.add(element) : null;
  });
  return follower;
}

List<Comment> getCommentsByPost(Post post) {
  List<Comment> c =
      comments.where((element) => element.post.id == post.id).toList();
  c.sort(((a, b) => a.created.compareTo(b.created)));
  return c.toList();
}

void repost(Post post, String caption) {
  Post post2 = Post(
      product: post.product,
      caption: caption,
      author: currentUser,
      isRepost: true);
  posts.add(post2);
  
  Fluttertoast.showToast(msg: 'Reposted');
}

List<User> getFollowing(User user) {
  List<User> follower = [];
  users.forEach((element) {
    getFollowerInfo(user, element)['iFollow']! ? follower.add(element) : null;
  });
  return follower;
}

String generateUniqueId() {
  var uuid = Uuid();
  return uuid.v4();
}

void updateChat(Chat chat, Message message) {
  chats.firstWhere((element) => element.id == chat.id).messages.add(message);
}
