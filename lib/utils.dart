import 'package:dara_store/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'components/data.dart';
import 'models/Product.dart';
import 'models/chat.dart';
import 'models/comment.dart';
import 'models/followers.dart';
import 'models/message.dart';
import 'models/post.dart';
import 'models/trade.dart';

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
      print(12);
    }
    if (element.first.id == you.id && element.followedBack.id == me.id) {
      map['youFollow'] = true;
      element.isFollowBack ? map['iFollow'] = true : map['iFollow'] = false;
      print(13);
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

void confirmTrade(Trade trade, bool accept) {
  trades.firstWhere((element) => element.id == trade.id).isAccepted = accept;
  Fluttertoast.showToast(
      msg: accept
          ? 'The trade has been accepted'
          : 'The trade has been decline');
}

String generateUniqueId() {
  var uuid = Uuid();
  return uuid.v4();
}

bool isTradeUnactive(Trade trade) {
  bool cc(bool? x) {
    return x ?? false;
  }

  return trade.isAccepted != null ||
      trade.product.isSold ||
      !trade.product.isAvailable ||
      trades.any((element) =>
          element.product.id == trade.product.id && cc(element.isAccepted));
}

void updateChat(Chat chat, Message message) {
  chats.firstWhere((element) => element.id == chat.id).messages.add(message);
}

void unFollow(User me, User you) {
  for (var element in followersGenerale) {
    if (element.first.id == me.id &&
        element.followedBack.id == you.id &&
        element.isFollowBack) {
      followersGenerale
          .add(Followers(first: you, followedBack: me, isFollowBack: false));
      followersGenerale.remove(element);
      break;
    }
    if (element.first.id == me.id &&
        element.followedBack.id == you.id &&
        !element.isFollowBack) {
      followersGenerale.remove(element);
      break;
    }
    if (element.first.id == you.id &&
        element.followedBack.id == me.id &&
        element.isFollowBack) {
      element.isFollowBack = false;
      break;
    }
  }
}

void follow(User me, User you) {
  bool b = false;
  print(getFollowerInfo(me, you));
  // if (!(followersGenerale.any((element) =>
  //     element.first.id == me.id && element.followedBack.id == you.id))) {
  //   print(1);
  for (var element in followersGenerale) {
    if (element.first.id == you.id &&
        element.followedBack.id == me.id &&
        !element.isFollowBack) {
      element.isFollowBack = true;
      b = true;
      print(2);
      break;
    }
  }
  !b
      ? followersGenerale
          .add(Followers(first: me, followedBack: you, isFollowBack: false))
      : null;
  print(3);
  print(getFollowerInfo(me, you));
  // }
  if (!(followersGenerale.any((element) =>
      element.first.id == you.id && element.followedBack.id == me.id))) {}
}

List<User> searchUsers(List<User> _users, String query) {
  if (query.isEmpty) {
    // If the search query is empty, return the original list
    return _users;
  }

  query = query.toLowerCase();

  return _users.where((user) {
    // Convert all user properties to lowercase for case-insensitive search
    String username = user.username.toLowerCase();
    // String name = user.name.toLowerCase();
    String bio = user.bio.toLowerCase();
    // String lastName = user.lastName.toLowerCase();

    // Check if any of the user properties contain the search query
    return username.contains(query) ||
        // name.contains(query) ||
        bio.contains(query) ||
        // lastName.contains(query) ||
        username.split(' ').any((part) => part.startsWith(query)) ||
        bio.split(' ').any((word) => word.startsWith(query));
  }).toList();
}

void changeSellerState(User user, bool bol) {
  users.firstWhere((element) => user.id == element.id).isSeller = bol;
}
