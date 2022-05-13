import 'dart:math';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';


class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  // on rebuild clear cache
  @override
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
  }  
}
