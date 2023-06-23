// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../components/data.dart';
import 'chat.dart';
import 'trade.dart';
import 'user.dart';

class Message extends Identifiable {
  String? message;
  DateTime send;
  Trade? trade;
  User sender;
  Message({
    this.message,
    required this.send,
    this.trade,
    required this.sender,
  });

  bool isTrade(){
    return trade==null?false:true;
  }
  bool isMe(){
    return sender.id==currentUser.id?true:false;
  }
}
