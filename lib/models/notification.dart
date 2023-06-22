class Notification {
  String title;
  String avatarUrl;
  String content;
  String action;
  String time;
  String subTitle;

  Notification(
      {required this.title, required this.avatarUrl, this.content='', this.action='', required this.time,this.subTitle=''});
}

final List<Notification> notifications = [
  Notification(
      title: "Alex Edward Martinez",
      avatarUrl: 'assets/images/person1.jpg',
      action: "Commented on your post",
      content:
          '"I am interested in taking your propety on rent. Contact me at +449879879879"',
      time: "09:24 PM"),
  Notification(
      title: "Amber Byrd and 14 others ",
      subTitle:'liked your post',
      avatarUrl: 'assets/images/person4.jfif',
      time: "03:22 PM"),
];
