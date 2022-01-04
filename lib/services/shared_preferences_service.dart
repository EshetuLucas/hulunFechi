import 'package:hulunfechi/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final log = getLogger('SharedPreferencesService');
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  final bool? enableLogs;

  SharedPreferencesService({this.enableLogs});

  static Future<SharedPreferencesService> getInstance(
      {bool enableLogs = false}) async {
    if (_instance == null) {
      _instance = SharedPreferencesService(enableLogs: enableLogs);
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance!;
  }

  void dispose() {
    log.i('');
    _preferences?.clear();
  }

  static const _isUserLoggedInKey = 'isUserLoggedIn';
  static const _FreshInstall = "fresh_install";

  bool get isUserLoggedIn =>
      (getFromDisk(_isUserLoggedInKey) as bool?) ?? false;
  set isUserLoggedIn(bool value) => saveToDisk(_isUserLoggedInKey, value);

  /// returns true if the [_FreshInstall] key returns null, hasUser returns false and guestMode
  /// returns false.
  bool get freshInstall =>
      getFromDisk(_FreshInstall) == null && !isUserLoggedIn;
  void indicateAppOpened() => saveToDisk(_FreshInstall, false);

  dynamic getFromDisk(String key) {
    var value = _preferences?.get(key);
    if (enableLogs!) log.v('key:$key value:$value');
    return value;
  }

  dynamic getEntertainerId(String key) {
    var value = _preferences!.getString(key);
    //if (enableLogs) log.v('key:$key value:$value');
    return value;
  }

  dynamic getKeys() => _preferences!.getKeys();
  void setEntertainerId(String key, String content) {
    _preferences!.setString(key, content);
  }

  void saveToDisk(String key, dynamic content) {
    if (enableLogs!) log.v('key:$key value:$content');

    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences?.setBool(key, content);
    }
    if (content is int) {
      _preferences?.setInt(key, content);
    }
    if (content is double) {
      _preferences?.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }
}
