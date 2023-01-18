import 'package:flutix/app/modules/home/components/movie_browse.dart';
import 'package:flutix/app/modules/home/components/movie_header.dart';
import 'package:flutix/app/modules/home/components/movie_playing.dart';
import 'package:flutter/material.dart';

class TabMovie extends StatelessWidget {
  const TabMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: const [
        MovieHeader(),
        MoviePlaying(),
        MovieBrowse(),
      ],
    );
  }
}
