import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Video 1: Introducción a las matemáticas',
      'url': 'https://youtu.be/M05xtGQoUeg?si=6gYB7B3mrimgjQHm'
    },
    {
      'title': 'Video 2: Sumas y restas',
      'url': 'https://www.youtube.com/watch?v=c9cTIjBqFTw'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades Matemáticas'),
        backgroundColor: const Color.fromARGB(255, 255, 98, 41),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.video_library),
            title: Text(videos[index]['title']!),
            onTap: () async {
              final url = videos[index]['url']!;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'No se pudo abrir $url';
              }
            },
          );
        },
      ),
    );
  }
}
