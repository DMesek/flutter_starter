// ignore_for_file: constant_identifier_names, use_setters_to_change_properties, avoid_classes_with_only_static_members
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
  static AppEnvironment get environment => _environment;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: 'APP_NAME Dev',
    AppEnvironment.PROD: 'APP_NAME Prod',
    AppEnvironment.STAGING: 'APP_NAME Staging',
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.PROD: 'prod',
    AppEnvironment.STAGING: 'staging',
  };

  //TODO: replace placeholders with real URLs
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
