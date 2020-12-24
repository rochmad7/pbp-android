import 'package:flutter/material.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';

String icon1 = "material://Icons.work";
String icon2 = "material://Icons.smartphone";

List list = [

  {
    "id": "business",
    "name": "Business",
    "icon": XIconData.fromUri(icon1),
    "color": Colors.teal
  },
  {
    "id": "technology",
    "name": "Technology",
    "icon": XIconData.fromUri(icon2),
    "color": Colors.grey[600]
  },
  {
    "id": "science",
    "name": "Science",
    "icon": Icons.science,
    "color": Colors.green[600]
  },
  {
    "id": "sport",
    "name": "Sports",
    "icon": Icons.directions_bike,
    "color": Colors.deepOrange
  },
  {
    "id": "gaming",
    "name": "Gaming",
    "icon": Icons.videogame_asset,
    "color": Colors.orange
  },
  {
    "id": "general",
    "name": "General",
    "icon": Icons.people,
    "color": Colors.cyan
  },
  {
    "id": "entertainment",
    "name": "Entertainment",
    "icon": Icons.local_movies,
    "color": Colors.purple
  },
  {
    "id": "health",
    "name": "Health",
    "icon": Icons.local_hospital,
    "color": Colors.red
  },
  {
    "id": "music",
    "name": "Music",
    "icon": Icons.music_note,
    "color": Colors.amber
  },
  {
    "id": "politics",
    "name": "Politics",
    "icon": Icons.assistant_photo,
    "color": Colors.blueGrey
  },
];
