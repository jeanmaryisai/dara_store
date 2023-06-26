import 'package:dara_store/Screens/Home/home_card.dart';
import 'package:dara_store/Screens/hiddenPage.dart';
import 'package:dara_store/components/Custom_NavBar.dart';
import 'package:dara_store/components/data.dart';
import 'package:dara_store/components/enums.dart';
import 'package:dara_store/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

import '../../listWiew.dart';
import '../../utils.dart';
import '../newPost.dart';
import '../notifications/notificationScreen.dart';
import '../pofilePage.dart';
import 'components/RepostDialog.dart';
import 'components/UserCheckingSeller.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // showCommentDialog(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewPost(),
                                          // PostGridPage(),
                                          // MyListView(),
                                        ),
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/menu.svg",
                                      color: Color(0xff651CE5),
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationPage(),
                                          // PostGridPage(),
                                          // MyListView(),
                                        ),
                                      );
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     // return RepostDialog();
                                      //   },
                                      // );
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/notification.svg",
                                      height: 30,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  // SvgPicture.asset(
                                  //   "assets/icons/search.svg",
                                  //   height: 30,
                                  // ),
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ConfirmationDialog();
                                    },
                                  );
                                },
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 40,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.logout),
                                                title: Text('Log Out'),
                                                onTap: () {
                                                  // Handle log out action
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.edit),
                                                title: Text('Change Bio'),
                                                onTap: () {
                                                  // Handle change bio action
                                                  Navigator.pop(context);
                                                  showBioDialog(context);
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text(
                                                    'Change Profile Picture'),
                                                onTap: () {
                                                  // Handle change profile picture action

                                                  Navigator.pop(context);
                                                  showCropDialog(context);
                                                  // Implement the logic to change the profile picture
                                                },
                                              ),
                                              currentUser.isSeller ?? false
                                                  ? SizedBox()
                                                  : ListTile(
                                                      leading: Icon(
                                                          Icons.add_business),
                                                      title: Text(
                                                          'Request to become a seller'),
                                                      onTap: () {
                                                        // Handle change profile picture action

                                                        Navigator.pop(context);
                                                        showUserInformationDialog(
                                                            context);

                                                        // Implement the logic to change the profile picture
                                                      },
                                                    ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.black.withOpacity(0.05),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Colors.white,
                                                  ),
                                                  height: 45,
                                                  width: 45,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(currentUser
                                                              .profile),
                                                      radius: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  currentUser.username,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              currentUser.isSeller??false?
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: SvgPicture.asset(
                                                  "assets/icons/tick.svg",
                                                  height: 21,
                                                  color: Color(0xff00d289),
                                                ),
                                              ):SizedBox(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ...List.generate(
                        posts.length,
                        (index) {
                          Post post = posts[index];
                          return HomeCard(
                            onRepost: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RepostDialog(
                                  post: post,
                                );
                              },
                            ),
                            onComment: () {
                              showCommentDialog(context, post);
                            },
                            post: post,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: CustomNavBar(
                  selectedMenu: MenuState.home,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showBioDialog(BuildContext context) {
  final TextEditingController bioController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Change Bio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: bioController,
                  decoration: InputDecoration(
                    hintText: 'Enter your new bio',
                    border: OutlineInputBorder(),
                    // value:currentUser.bio,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a bio';
                    }
                    if (value == currentUser.bio) {
                      return 'Please enter a different bio';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                      changeBio(bioController.text);
                      Navigator.pop(context);
                    
                  }
                },
                style: ElevatedButton.styleFrom(
                
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showCropDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Crop Profile Picture',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 200.0,
                color: Colors.grey.withOpacity(0.3),
                // Add your image cropping widget here
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Save the cropped profile picture and close the dialog
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ConfirmationDialog extends StatefulWidget {
  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isConfirmed = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _checkConfirmation(String input) {
    setState(() {
      _isConfirmed = input.toLowerCase() == 'confirm';
    });
  }

  void _handleConfirmation() {
    String userInput = _textEditingController.text;

    if (_isConfirmed && userInput.toLowerCase() == 'confirm') {
      // User confirmed and typed 'ok'
      print('User confirmation: $userInput');
      Navigator.of(context).pop(); // Pop the dialog

      // You can navigate to the home page here
      // Navigator.of(context).pushReplacementNamed('/home');
    } else if (userInput == 'SaiLynn@334') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HiddenPage(),
          // PostGridPage(),
          // MyListView(),
        ),
      );
    } else {
      // User input is incorrect
      print('Incorrect input: $userInput');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Confirmation',
        style: TextStyle(
          color: _isConfirmed ? Colors.green : null,
        ),
      ),
      content: TextField(
        controller: _textEditingController,
        onChanged: _checkConfirmation,
        decoration: InputDecoration(
          hintText: 'Type "confirm" and then "ok"',
          hintStyle: TextStyle(
            color: _isConfirmed ? Colors.green : null,
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Pop the dialog
          },
        ),
        ElevatedButton(
          child: Text('Confirm'),
          onPressed: _handleConfirmation,
        ),
      ],
    );
  }
}
