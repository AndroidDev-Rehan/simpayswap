import 'package:shared_preferences/shared_preferences.dart';

class Preferences
{
  void setPref(String key,String value)async
  {
    final pref=await SharedPreferences.getInstance();
    pref.setString(key, value);
  }
  Future<String> getPref(String key)async
  {
    final pref=await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }
  Future<void> clearPref()async
  {
    final pref=await SharedPreferences.getInstance();
    pref.clear();
  }
}