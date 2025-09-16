import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else {
      return;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  // static Future<void> setUser(UserModel user) async {
  //   final userJsonString = jsonEncode(user.toJson());
  //   debugPrint(
  //     'SharedPrefHelper : setUser with userJsonString : $userJsonString',
  //   );
  //   await setData(Constants.userKey, userJsonString);
  //   debugPrint('SharedPrefHelper : setUser completed');
  // }

  // static Future<UserModel?> getUser() async {
  //   debugPrint('SharedPrefHelper : getUser');
  //   final userJsonString = await getString(Constants.userKey);
  //   debugPrint('SharedPrefHelper : getUser userJsonString: $userJsonString');
  //   if (userJsonString.isNotEmpty) {
  //     final userJson = jsonDecode(userJsonString);
  //     debugPrint('SharedPrefHelper : getUser parsed userJson: $userJson');
  //     return UserModel.fromJson(userJson);
  //   }
  //   debugPrint('SharedPrefHelper : getUser no user found, returning null');
  //   return null;
  // }

  // static Future<void> removeUser() async {
  //   debugPrint('SharedPrefHelper : removeUser');
  //   await removeData(Constants.userKey);
  // }

  // static Future<void> setDarkMode(bool isDark) async {
  //   debugPrint('SharedPrefHelper : setDarkMode with isDark: $isDark');
  //   await setData(Constants.isDarkModeKey, isDark);
  // }
}
