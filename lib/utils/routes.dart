import 'package:flutter/material.dart';
import 'package:dara_store/models/message.dart';
import 'package:dara_store/utils/index.dart';
import 'package:dara_store/views/addPost.dart';
import 'package:dara_store/views/message.dart';
import 'package:dara_store/views/messages.dart';
import 'package:dara_store/views/newsfeed.dart';
import 'package:dara_store/views/notification.dart';
import 'package:dara_store/views/profile.dart';
import 'package:dara_store/views/signin.dart';
import 'package:dara_store/views/signup.dart';

const String SignInViewRoute = '/signin';
const String SignUpViewRoute = '/signup';
const String NewsFeedViewRoute = '/feed';
const String MessagesViewRoute = '/messages';
const String MessageViewRoute = '/message';
const String ProfileViewRoute = '/profile';
const String NotificationViewRoute = '/notification';
const String IndexViewRoute = '/index';
const String AddPostViewRoute = '/addpost';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case NewsFeedViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => NewsFeed());
      break;
    case IndexViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Index());
      break;
    case AddPostViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => AddPost());
      break;
    case SignInViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => SignIn());
      break;
    case SignUpViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => SignUp());
      break;
    case MessagesViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Messages());
      break;
    case MessageViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) {
        Message1? message = args as Message1?;
        if (message == null) {
          message = Message1(
            avatarUrl: '',
            sender: '',
            time: '',
            content: '',
            number: 0,
            online: false,
          );
        }
        return Message(
          sender: message.sender,
          avatarUrl: message.avatarUrl,
          time: message.time,
          content: message.content,
          number: message.number,
          online: message.online,
        );
      });
      break;
    case ProfileViewRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Profile());
      break;
    case NotificationViewRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => Notifications());
      break;
    default:
      return MaterialPageRoute(builder: (BuildContext context) => NewsFeed());
  }
}
