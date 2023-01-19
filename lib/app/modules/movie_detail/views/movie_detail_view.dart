import 'package:flutix/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'Movie Detail',
      child: Column(
        children: [
          Text(controller.movieData.value.releaseDate),
        ],
      ),
    );
  }
}
