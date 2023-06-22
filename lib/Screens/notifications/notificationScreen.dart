import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notifications = [];
  ScrollController _scrollController = ScrollController();
  int pageSize = 20;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Fetch initial notifications
    fetchNotifications();
    // Add scroll listener
    _scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // User reached the bottom of the list
      loadMoreNotifications();
    }
  }

  Future<void> fetchNotifications() async {
    // Simulate API request
    await Future.delayed(Duration(seconds: 2));

    // Generate dummy notifications
    List<NotificationModel> newNotifications = List.generate(
      pageSize,
      (index) => NotificationModel(
        id: index.toString(),
        message: 'Notification ${index + 1}',
      ),
    );

    setState(() {
      notifications.addAll(newNotifications);
    });
  }

  Future<void> loadMoreNotifications() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      // Simulate API request
      await Future.delayed(Duration(seconds: 2));

      // Generate more dummy notifications
      List<NotificationModel> newNotifications = List.generate(
        pageSize,
        (index) => NotificationModel(
          id: (notifications.length + index).toString(),
          message: 'Notification ${notifications.length + index + 1}',
        ),
      );

      setState(() {
        notifications.addAll(newNotifications);
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: notifications.length + 1,
        itemBuilder: (context, index) {
          if (index < notifications.length) {
            // Display notification item
            return ListTile(
              title: GestureDetector(
                  onTap: () {
                    showCommentDialog(context);
                  },
                  child: Text(notifications[index].message)),
            );
          } else if (isLoading) {
            // Display loading indicator at the end of the list while more notifications are being loaded
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Reached the end of the list and no more notifications to load
            return SizedBox();
          }
        },
      ),
    );
  }
}

class NotificationModel {
  final String id;
  final String message;

  NotificationModel({required this.id, required this.message});
}

List<Comment> comments = [
  Comment(
    username: 'John Doe',
    userAvatar: 'assets/images/dm1.jpg',
    comment: 'Great post!',
  ),
  Comment(
    username: 'Jane Smith',
    userAvatar: 'assets/images/dm1.jpg',
    comment: 'I love this!',
  ),
  Comment(
    username: 'Mark Johnson',
    userAvatar: 'assets/images/dm1.jpg',
    comment: 'Awesome content!',
  ),
  // Add more comments here
];

class Comment {
  final String username;
  final String userAvatar;
  final String comment;

  Comment({
    required this.username,
    required this.userAvatar,
    required this.comment,
  });
}
// In this example, the comments list contains instances of the Comment class. Each comment h

void showCommentDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    builder: (BuildContext context) {
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
                      // Add comment functionality
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(comments[index].userAvatar),
                    ),
                    title: Text(
                      comments[index].username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      comments[index].comment,
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
