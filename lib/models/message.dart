class Message1 {
  String sender;
  String avatarUrl;
  String time;
  String content;
  int number;
  bool online;

  Message1({
    required this.sender, 
    required this.avatarUrl, 
    required this.time, 
    required this.content, 
    this.number=0,
    required this.online});
}

final List<Message1> messages = [
  Message1(
    sender: 'Vermon Bradley',
    avatarUrl: 'assets/images/person1.jpg',
    time: '5:45 PM',
    content: 'Shall we meet today?',
    number: 1,
    online:true,
  ),
  Message1(
    sender: 'Jason Howard',
    avatarUrl: 'assets/images/person2.jfif',
    time: '11:12 AM',
    content: 'Hahahahahah..😂',
    number: 2,
    online:true
  ),
  Message1(
    sender: 'Melvin Burgess',
    avatarUrl: 'assets/images/person3.jfif',
    time: '10:45 AM',
    content: 'Sounds perfect to me.😎',
    online:false
  ),
    Message1(
    sender: 'Duane McDonald',
    avatarUrl: 'assets/images/person4.jfif',
    time: '8:06 AM',
    content: 'The cost is too high, Can you have us come to some form of agreement?',
    online:true
  ),
    Message1(
    sender: 'Isabella Clayton',
    avatarUrl: 'assets/images/person5.jpeg',
    time: 'Yesterday',
    content: 'I think , i am going fot it. Thanks alot',
    online:true
  ),
    Message1(
    sender: 'Addies Cain',
    avatarUrl: 'assets/images/person6.jpg',
    time: 'Yesterday',
    content: 'Oooh yeah! YOLO!!? 😍💛',
    online:false
  )
];
