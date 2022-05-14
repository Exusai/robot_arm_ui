import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  // on rebuild clear cache
  final stream = Media.network(
    'http://localhost:8080/stream?topic=/image_raw&bitrate=250000'
  );

  Player player = Player(id: 69420, videoDimensions: const VideoDimensions(512, 512),);

  @override
  Widget build(BuildContext context) {
    player.open(
      stream,
      autoStart: true, // default
    );
    
    return Video(
      player: player,
      height: 512,
      width: 512,
      showControls: false,
      scale: 1,
    );
  }  
  
  /* @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(const Duration(milliseconds: 1000),
      builder: (context) {
        String url = 'http://localhost:8080/snapshot?topic=/image_raw&v=${Random().nextInt(10)}';
        //String url = 'http://localhost:8080/stream?topic=/image_raw&bitrate=250000&type=vp8';
        //String url = 'https://via.placeholder.com/512x512';
        return ExtendedImage.network(
          url,
          cache: false,
        );
      }
    );
  }   */
}
