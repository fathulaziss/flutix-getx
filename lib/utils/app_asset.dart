class AppAsset {
  static String icon(String s) {
    return 'assets/icons/$s';
  }

  static String logo(String s) {
    return 'assets/logos/$s';
  }

  static String image(String s) {
    return 'assets/images/$s';
  }

  static String browseMovieIcon(int value) {
    switch (value) {
      case 27:
        return AppAsset.icon('ic_horror.png');
      case 28:
        return AppAsset.icon('ic_action.png');
      case 35:
        return AppAsset.icon('ic_comedy.png');
      case 878:
        return AppAsset.icon('ic_scifi.png');
      case 10749:
        return AppAsset.icon('ic_romance.png');
      case 53:
        return AppAsset.icon('ic_thriller.png');
      case 10402:
        return AppAsset.icon('ic_musical.png');
      case 9648:
        return AppAsset.icon('ic_mystery.png');
      default:
        return AppAsset.icon('ic_horror.png');
    }
  }

  static String browseMovieName(int value) {
    switch (value) {
      case 27:
        return 'Horror';
      case 28:
        return 'Action';
      case 35:
        return 'Comedy';
      case 878:
        return 'Sci-Fi';
      case 10749:
        return 'Romance';
      case 53:
        return 'Thriller';
      case 10402:
        return 'Musical';
      case 9648:
        return 'Mystery';
      default:
        return 'Horror';
    }
  }
}
