// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'chat.dart';
import 'post.dart';

class User extends Identifiable {
  String username;
  String password;
  String bio;
  String profile;
  User(
      {
      required this.username,
      required this.password,
      required this.profile,
      this.bio = "Hello I am user Mirv_store"});
}
