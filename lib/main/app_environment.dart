enum AppEnvironment { DEV, PROD, STAGING }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get assetBaseUrl => _environment._assetBaseUrl;
  static String get apiBaseUrl => _environment._apiBaseUrl;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: 'APP_NAME_DEV',
    AppEnvironment.PROD: 'APP_NAME_PROD',
    AppEnvironment.STAGING: 'APP_NAME_STAGING',
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.PROD: 'prod',
    AppEnvironment.STAGING: 'staging',
  };

  static const _apiBaseUrls = {
    AppEnvironment.DEV: 'API_BASE_DEV',
    AppEnvironment.PROD: 'API_BASE_PROD',
    AppEnvironment.STAGING: 'API_BASE_STAGING',
  };

  static const _assetBaseUrls = {
    AppEnvironment.DEV: 'ASSET_BASE_DEV',
    AppEnvironment.PROD: 'ASSET_BASE_PROD',
    AppEnvironment.STAGING: 'ASSET_BASE_STAGING',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _apiBaseUrl => _apiBaseUrls[this]!;
  String get _assetBaseUrl => _assetBaseUrls[this]!;
}
