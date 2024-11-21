import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Video 1: Introducción a las matemáticas',
      'url': 'https://www.youtube.com/watch?v=c9cTIjBqFTw'
    },
    {
      'title': 'Video 2: Sumas y restas',
      'url': 'https://www.youtube.com/watch?v=2fZgR6JYov4'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tutoriales en Video')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffF9FBE7),
              Color(0xffF0EDD4),
              Color(0xffECCDB4),
              Color(0xffFEA1A1),
              Color(0xffD14D72),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.video_library),
              title: Text(
                videos[index]['title']!,
                style: TextStyle(
                  color: Colors.black, // Color del texto para que sea legible
                ),
              ),
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
      ),
    );
  }
}
