import 'package:dara_store/components/Custom_NavBar.dart';
import 'package:dara_store/components/data.dart';
import 'package:dara_store/components/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/user.dart';
import '../../utils.dart';
import '../profile/ProfileScreen.dart';

class Discover extends StatefulWidget {
  static String routeName = "/discover";
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  List<User> _users=users;
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SearchBar(onChanged: (query) {
                _users=searchUsers(users,query);
                setState(() {
                  
                });
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  User friend = _users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                              friend.profile,
                            ),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      title: Text(friend.username),
                      subtitle: Text(friend.bio),
                      trailing: getFollowerInfo(currentUser, friend)['iFollow']!
                          ? Container(
                              width: 100.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff651CE5).withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.9],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.

                                    Colors.black.withOpacity(0.5),
                                    Colors.grey,
                                  ],
                                ),
                              ),
                              child: TextButton(
                                child: Text(
                                  'UnFollow',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  unFollow(currentUser, friend);
                                  setState(() {});
                                },
                              ),
                              // FlatButton(
                              //   child: Text(
                              //     'Unfollow',
                              //     style: TextStyle(
                              //       fontSize: 16.0,
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              //   textColor: Colors.white,
                              //   color: Colors.transparent,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(30.0)),
                              //   onPressed: () {},
                              // ),
                            )
                          : Container(
                              width: 100.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff651CE5).withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.1, 0.9],
                                  colors: [
                                    // Colors are easy thanks to Flutter's Colors class.
                                    Color(0xff651CE5),
                                    Color(0xff811ce5),
                                  ],
                                ),
                              ),
                              child: TextButton(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  follow(currentUser, friend);
                                  setState(() {});
                                },
                              ),
                              // FlatButton(
                              //   child: Text(
                              //     'Follow',
                              //     style: TextStyle(
                              //       fontSize: 16.0,
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              //   textColor: Colors.white,
                              //   color: Colors.transparent,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(30.0)),
                              //   onPressed: () {},
                              // ),
                            ),
                      onTap: () {
                         Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen(user: friend),
                                          // PostGridPage(),
                                          // MyListView(),
                                        ),
                                      );
                      
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomNavBar(
                selectedMenu: MenuState.discover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final void Function(String) onChanged;

  const SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              width: 20.0,
              height: 20.0,
            ),
          ),
          hintText: 'Search...',
          border: InputBorder.none,
         
        ),
      ),
    );
  }
}
