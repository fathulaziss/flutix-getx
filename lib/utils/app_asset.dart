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
      case 1:
        return AppAsset.icon('ic_horror.png');
      case 2:
        return AppAsset.icon('ic_action.png');
      case 3:
        return AppAsset.icon('ic_comedy.png');
      case 4:
        return AppAsset.icon('ic_scifi.png');
      case 5:
        return AppAsset.icon('ic_romance.png');
      case 6:
        return AppAsset.icon('ic_thriller.png');
      case 7:
        return AppAsset.icon('ic_musical.png');
      case 8:
        return AppAsset.icon('ic_mystery.png');
      default:
        return AppAsset.icon('ic_horror.png');
    }
  }

  static String browseMovieName(int value) {
    switch (value) {
      case 1:
        return 'Horror';
      case 2:
        return 'Action';
      case 3:
        return 'Comedy';
      case 4:
        return 'Sci-Fi';
      case 5:
        return 'Romance';
      case 6:
        return 'Thriller';
      case 7:
        return 'Musical';
      case 8:
        return 'Mystery';
      default:
        return 'Horror';
    }
  }
}
