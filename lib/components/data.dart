import 'dart:math';

import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../models/chat.dart';
import '../models/comment.dart';
import '../models/followers.dart';
import '../models/message.dart';
import '../models/notifs.dart';
import '../models/post.dart';
import '../models/trade.dart';
import '../models/user.dart';
import '../utils.dart';

Random random = Random();
List names = [
  "Blake Bird",
  "Avery Howell",
  "Dexter Ward",
  "Hunter Bradley",
  "Bill Buckley",
  "Vera Marsh",
  "Ruth Burton",
  "Carmen Blake",
  "Paige Lawrence",
  "Geneva Mccoy",
  "Cecilia Abbott",
];

List hash = [
  "#love, #instagood, #me",
  "#tbt, #cute, #follow, #followme",
  "Lenard Milton",
  "#photooftheday, #happy, #tagforlikes, #beautiful",
  "#self, #girl, #picoftheday, #like4like",
  "Guadalupe Ratledge",
  "#smile, #friends, #fun",
  "#food, #swag, #amazing, #tflers",
  "#style, #wcw, #family",
  "#pretty, #repost, #hair",
  "#girls, #all_shots, #party",
];

List<String> titles = [
  "La Joconde",
  "La Nuit étoilée",
  "Les Tournesols",
  "Guernica",
  "La Cène",
  "Les Demoiselles d'Avignon",
  "Le Cri",
  "Les Nymphéas",
  "Les Perséides",
  "Les Amoureux",
  "La Liberté guidant le peuple",
  "La Grande Vague de Kanagawa",
  "Les Ménines",
  "La Persistance de la mémoire",
  "Les Raboteurs de parquet",
  "Les Trois Musiciens",
  "Les Danseuses Bleues",
  "Le Baiser",
  "La Danse",
  "Les Amants",
];

List<User> users = List.generate(
    11,
    (index) => User(
        profile: "assets/images/dm${random.nextInt(4)}.jpg",
        username: names[index],
        password: 'admin'));

List messages = [
  "I am a traveler",
  "Are you available tomorrow?",
  "It's late. Go to bed!",
  "I know what I want - Confidence",
  "I work in an office",
  "The last rocket🚀",
  "I do NOT work in an office",
  "Will you be attending the meetup tomorrow?",
  "Are you angry at something?",
  "I am a bit of a bright spark - Intelligence",
  "Can i hear your voice?",
];

List<String> descriptions = [
  "Une célèbre peinture de Leonardo da Vinci représentant le portrait énigmatique d'une femme avec un sourire mystérieux.",
  "Une peinture emblématique de Vincent van Gogh illustrant un ciel nocturne tourbillonnant rempli d'étoiles brillantes.",
  "Une série de peintures de tournesols réalisées par Vincent van Gogh, représentant des bouquets lumineux de cette fleur emblématique.",
  "Une peinture de Pablo Picasso dépeignant les horreurs de la guerre et de la violence.",
  "Une fresque de Leonardo da Vinci représentant le dernier repas de Jésus avec ses disciples.",
  "Une œuvre révolutionnaire de Pablo Picasso marquant le début du mouvement cubiste dans l'art.",
  "Une célèbre peinture d'Edvard Munch représentant un visage criant d'angoisse et de désespoir.",
  "Une série de peintures de Claude Monet dépeignant les magnifiques nymphéas dans son jardin à Giverny.",
  "Une peinture abstraite de Jackson Pollock capturant l'énergie et le mouvement des étoiles filantes.",
  "Une œuvre romantique de Marc Chagall représentant un couple d'amoureux flottant dans les airs.",
  "Une peinture révolutionnaire d'Eugène Delacroix représentant la Liberté guidant le peuple lors de la Révolution française.",
  "Une célèbre estampe japonaise d'Hokusai représentant une grande vague déferlante sur la côte de Kanagawa.",
  "Un tableau emblématique de Diego Velázquez représentant la famille royale espagnole dans un grand salon.",
  "Une peinture surréaliste de Salvador Dalí représentant des montres molles et déformées.",
  "Un tableau réaliste de Gustave Caillebotte dépeignant des ouvriers en train de raboter un parquet.",
  "Une œuvre cubiste de Pablo Picasso représentant trois musiciens dans des formes géométriques.",
  "Des danseuses peintes par Edgar Degas avec des robes et des chapeaux bleus évoquant la grâce et le mouvement.",
  "Une sculpture emblématique d'Auguste Rodin représentant un couple s'embrassant passionnément.",
  "Une série de peintures de Henri Matisse dépeignant des figures dansantes dans des couleurs vives et audacieuses.",
  "Un tableau de René Magritte montrant deux amants s'embrassant avec des draps qui cachent leur visage.",
];
double? getdouble(int index) {
  return index % 2 == 0 ? random.nextDouble() * 10000 : null;
}

List<Product> products = List.generate(
    20,
    (index) => Product(
        title: titles[index],
        description: descriptions[index],
        image: "assets/images/dm${random.nextInt(4)}.jpg",
        // owner: users[random.nextInt(10)],
        owner: currentUser,
        staticPrice: getdouble(index)));

List<NotificationCustom> notifs = [
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message:
        "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} mentioned you in a comment",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} shared your post",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} commented on your post",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} replied to your comment",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} reacted to your comment",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} asked you to join a Group️",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} asked you to like a page",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "You have memories with ${names[random.nextInt(10)]}",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message:
        "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  ),
  NotificationCustom(
    receiver: currentUser,
    isAbout: getUserByName(names[random.nextInt(10)]),
    message: "${names[random.nextInt(10)]} Sent you a friend request",
  ),
];

String defaultimg='';
// List<Trade> trades=

List<Post> posts = List.generate(
    11,
    (index) => Post(
          author: getUserByName(names[random.nextInt(10)])!,
          caption: messages[random.nextInt(10)],
          product: products[random.nextInt(18)],
          isRepost: random.nextBool(),
          liked:List.generate(6, (index) => users[random.nextInt(10)])
        ));
List<Message> messagesGenerales = List.generate(
    10,
    (index) => Message(
        message: messages[random.nextInt(10)],
        send: DateTime.now(),
        sender: index % 2 == 0 ? currentUser : users[3],
        trade: index % 3 == 0 ? trades[random.nextInt(5)] : null));

List<Chat> chats = List.generate(
    13,
    (index) => Chat(
        messages: List.generate(
            10,
            (index) => Message(
                message: messages[random.nextInt(10)],
                send: DateTime.now(),
                sender: index % 2 == 0 ? currentUser : users[3],
                trade: index % 3 == 0 ? trades[random.nextInt(5)] : null)),
        user1: currentUser,
        user2: users[random.nextInt(10)]));

List<Trade> trades = List.generate(
    6,
    (index) => Trade(
        amout: random.nextDouble() * 100000,
        sender: index % 2 == 0 ? currentUser : users[3],
        receiver: index % 2 == 1 ? currentUser : users[3],
        isAccepted: null,
        product: products[index],
        created: DateTime.now(),
        buyer: users[3]));

List conversation = List.generate(
    10,
    (index) => {
          "username": "Group ${random.nextInt(20)}",
          "time": "${random.nextInt(50)} min ago",
          "replyText": messages[random.nextInt(10)],
          "isMe": random.nextBool(),
          "isGroup": false,
          "isReply": random.nextBool(),
        });

List<Followers> followersGenerale = [
  Followers(first: currentUser, followedBack: users[0], isFollowBack: true),
  Followers(first: currentUser, followedBack: users[1], isFollowBack: false),
  Followers(first: currentUser, followedBack: users[2], isFollowBack: true),
  Followers(first: currentUser, followedBack: users[4], isFollowBack: false),
  Followers(first: currentUser, followedBack: users[5], isFollowBack: true),
  Followers(first: currentUser, followedBack: users[6], isFollowBack: true),
  Followers(first: currentUser, followedBack: users[7], isFollowBack: true),
  Followers(first: currentUser, followedBack: users[8], isFollowBack: true),
  Followers(first: users[9], followedBack: currentUser, isFollowBack: false),
  Followers(first: users[10], followedBack: currentUser, isFollowBack: true)
];

List<Comment> comments=List.generate(
  50, (index) => Comment(
    comment:messages[random.nextInt(10)],
    author:users[random.nextInt(10)], 
    post:posts[random.nextInt(10)],
    created: DateTime.now().subtract(Duration(minutes: random.nextInt(20))
  )));

User currentUser = users[0];

enum quota {
  Like,
  Followed,
  Comment,
}

extension quotaValue on quota {
  int get value {
    switch (this) {
      case quota.Like:
        return 40;
      case quota.Followed:
        return 330;
      case quota.Comment:
        return 300;
    }
  }
}