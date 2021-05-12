
import 'package:games_ui/core/model/topic_model.dart';

class Forum {
  final String title;
  final String imagePath;
  final String rank;
  final List<Topic> topics;
  final String threads;
  final String subs;

  Forum({this.title, this.imagePath, this.rank, this.topics, this.threads, this.subs});
}

final haloForum = Forum(
  title: "Halo",
  imagePath: "assets/reach.jpg",
  rank: "1",
  threads: "88",
  subs: "500+",
  topics: haloTopics
);
final destinyForum = Forum(
  title: "Destiny",
  imagePath: "assets/destiny.jpg",
  rank: "25",
  threads: "120",
  subs: "100+",
  topics: destinyTopics
);
final chiefForum = Forum(
  title: "Destiny",
  imagePath: "assets/chief.jpg",
  rank: "4",
  threads: "300",
  subs: "1000+",
  topics: destinyTopics
);
final magicForum = Forum(
  title: "Magic",
  imagePath: "assets/magic.jpg",
  rank: "10",
  threads: "120",
  subs: "300+",
  topics: destinyTopics
);
final titanForum = Forum(
  title: "Titan",
  imagePath: "assets/titan.jpg",
  rank: "5",
  threads: "279",
  subs: "100+",
  topics: destinyTopics
);
final halo3Forum = Forum(
  title: "Halo 3",
  imagePath: "assets/halo3.jpg",
  rank: "35",
  threads: "120",
  subs: "300+",
  topics: destinyTopics
);

final forums = [
  haloForum,
  destinyForum,
  magicForum,
  chiefForum,
  titanForum,
];