// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

import '../views/message.dart';
import 'user.dart';

abstract class Identifiable {
  String id;
  Identifiable() : id = Uuid().v4();
}

class Chat extends Identifiable{
  User user1;
  User user2;
  List<Message> messages;

  Chat({
    required this.user1,
    required this.user2,
    required this.messages,
  });
}
