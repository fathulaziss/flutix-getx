enum Flavor { development, staging, production }

class AppConfig {
  static const urlDev = 'urlDev';
  static const urlStaging = 'urlStaging';
  static const urlProd = 'urlProd';

  static late Flavor appFlavor;

  static bool get isDevelopment {
    return appFlavor == Flavor.development;
  }

  static bool get isStaging {
    return appFlavor == Flavor.staging;
  }

  static bool get isProduction {
    return appFlavor == Flavor.production;
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return urlDev;

      case Flavor.production:
        return urlProd;

      case Flavor.staging:
        return urlStaging;
    }
  }
}
