import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/data.dart';
import '../../models/comment.dart';
import '../../models/notifs.dart';
import '../../models/post.dart';
import '../../utils.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // List<NotificationCustom> notifications = [];
  // ScrollController _scrollController = ScrollController();
  // int pageSize = 20;
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // // Fetch initial notifications
    // fetchNotifications();
    // // Add scroll listener
    // _scrollController.addListener(scrollListener);
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  // void scrollListener() {
  //   if (_scrollController.offset >=
  //           _scrollController.position.maxScrollExtent &&
  //       !_scrollController.position.outOfRange) {
  //     // User reached the bottom of the list
  //     loadMoreNotifications();
  //   }
  // }

  // Future<void> fetchNotifications() async {
  //   // Simulate API request
  //   await Future.delayed(Duration(seconds: 2));

  //   setState(() {
  //     notifications.addAll(notifs.getRange(1, pageSize));
  //   });
  // }

  // Future<void> loadMoreNotifications() async {
  //   if (!isLoading) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     // Simulate API request
  //     await Future.delayed(Duration(seconds: 2));

  //     setState(() {
  //       notifications.addAll(notifs.getRange(
  //           notifications.length, notifications.length + pageSize));
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title:Text('Notification'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              "assets/icons/back-arrow.svg",
              color: Colors.black,
            ),
          ),
        ),
      ),
      
      body: ListView.builder(
        // controller: _scrollController,
        itemCount: notifs.length,
        itemBuilder: (context, index) {
          
            NotificationCustom notif = notifs[index];
            // Display notification item
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  height: 55,
                  width: 55,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        notif.isAbout == null
                            ? defaultimg
                            : notif.isAbout!.profile,
                      ),
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  notif.isAbout == null ? 'Mirv_Store' : notif.isAbout!.username,
                ),
                subtitle: Text(notif.message),
                onTap: () {},
              ),
            );
          
        },
      ),
    );
  }
}

// In this example, the comments list contains instances of the Comment class. Each comment h

void showCommentDialog(BuildContext context, Post post) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    builder: (BuildContext context) {
      TextEditingController _controller = TextEditingController();
      return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      addCommentToPost(_controller.text, post);
                      _controller.clear();
                      // Add comment functionality
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getCommentsByPost(post).length,
                itemBuilder: (BuildContext context, int index) {
                  List<Comment> _comments = getCommentsByPost(post);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(_comments[index].author.profile),
                    ),
                    title: Text(
                      _comments[index].author.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _comments[index].comment,
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
