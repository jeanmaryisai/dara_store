import 'package:dara_store/Screens/DisCover/DiscoverScreen.dart';
import 'package:dara_store/Screens/Home/HomeScreen.dart';
import 'package:dara_store/Screens/Inbox/InboxScreen.dart';
import 'package:dara_store/Screens/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  //SplashPage.routeName: (context) => SplashPage(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  InboxScreen.routeName: (context) => InboxScreen(),
  Discover.routeName: (context) => Discover(),
};
