import 'package:dara_store/models/user.dart';
import 'package:uuid/uuid.dart';
import 'components/data.dart';
import 'models/Product.dart';

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
